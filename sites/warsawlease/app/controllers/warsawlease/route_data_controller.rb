module Warsawlease
  class RouteDataController < Warsawlease::ApplicationController
    include Sites
    include Responses

    def show
      route_url = request.headers['Route-Url']
      access_token = request.headers['Access-Token']
      track = request.headers['Track']
      meta = {}
      is_ssr = request.headers['Type'] == 'ssr'
      lang = request.headers['Lang']
      state = { 'app': { lang: lang } }
      page_name = request.headers['Page-Name']

      if route_url.match(/(\d+)-.*-(na-wynajem-warszawa|for-lease-warsaw)-.*$/)
        announcement = ::Warsawlease::Queries::Announcement::ById.new(id: $1).call
        state.merge!('announcement/show/data': ::Warsawlease::Serializers::Announcement::Show.new(announcement).call)
        meta.merge!(::Warsawlease::Serializers::Announcement::ShowMeta.new(announcement).call)
      end

      if ['root', 'announcement/index/catalogue'].include?(track)
        announcements = ::Warsawlease::Queries::Announcement::Index::Visitor.new.call
        serialized_announcements = ::Warsawlease::Serializers::Announcement::Index::Visitor.new(announcements).call
        state.merge!('announcement/index/data': { announcements: serialized_announcements, amount: announcements.count })
      end

      if track == 'announcement/index/my'
        @user ||= ::Commands::User::Authorize::AccessToken.new(access_token: access_token, site_name: 'Warsawlease' ).call
        announcements = ::Warsawlease::Queries::Announcement::Index::User.new(user_id: @user.id).call
        serialized_announcements = ::Warsawlease::Serializers::Announcement::Index::User.new(announcements).call
        state.merge!('announcement/index/data': { announcements: serialized_announcements, amount: announcements.count })
      end

      if track == 'announcement/edit'
        announcement_id = route_url.match(%r{(edytuj-ogloszenie|edit-announcement)/(\d+)})[2].to_i
        announcement = ::Warsawlease::Queries::Announcement::ById.new(id: announcement_id).call
        state.merge!('announcement/create/data': { announcement: ::Warsawlease::Serializers::Announcement::Edit.new(announcement).call })
      end

      if track == 'user/edit'
        @user ||= ::Commands::User::Authorize::AccessToken.new(access_token: access_token, site_name: 'Warsawlease' ).call
        return render json: {}, status: 401 if @user.blank?

        state.merge!(
          'user/edit/data': {
            country_code: @user.country_code,
            phone_number: @user.phone_number,
            email: @user.email
          }.merge(account_type_specific_attributes).deep_transform_keys { |key| key.to_s.camelize(:lower) }
        )
      end

      page = {}
      if page_name.present?
        page = Page.find_by(name: page_name, lang: lang)

        if page.present?
          urls = Page.where(name: page.name).pluck(:lang, :url).to_h
          page = page.slice(:name, :url, :body, :style, :title, :description, :keywords, :canonical_url, :picture, :meta, :lang).merge(lang_ver_urls: urls)

          state.merge!(
            'page/show/data': page.deep_transform_keys { |key| key.to_s.camelize(:lower) }
          )
        end
      end

      if track == 'page/create'
        state.merge!('page/create/data': { names: Page.all.pluck(:name).uniq.sort })
      end

      if track == 'page/edit'
        page_name_or_url = route_url.match(/^(edit-page|edytuj-strone)\/(.+)$/)[2]
        page = Page.find_by(name: page_name_or_url, lang: lang) || Page.find_by(url: page_name_or_url)
        urls = Page.where(name: page.name).pluck(:lang, :url).to_h
        page = page.slice(:name, :url, :body, :style, :title, :description, :keywords, :canonical_url, :picture, :meta, :lang).merge(lang_ver_urls: urls)

        state.merge!(
          'page/edit': page.deep_transform_keys { |key| key.to_s.camelize(:lower) }
        )
      end

      if track == 'page/index/manage'
        pages = Page.all.select(:name, :lang, :url)

        parsed_pages = {}
        pages.each do |page|
          urls = parsed_pages[page.name] || {}
          urls[page.lang] = page.url
          parsed_pages[page.name] = urls
        end

        state.merge!(
          'page/index/data': { pages: parsed_pages },
          'page/index/inputs': { name: '' }
        )
      end

      if track == 'page/show'
        page = Page.find_by(url: route_url)

        return render json: {}, status: 404 if page.blank?

        urls = Page.where(name: page.name).pluck(:lang, :url).to_h

        meta = {
          canonical_url: page.canonical_url,
          title: page.title,
          description: page.description,
          keywords: page.keywords,
          picture: page.picture,
          lang: page.lang
        }

        state.merge!(
          'app': { lang: page.lang },
          'page/show/data': page.slice(
            :name, :url, :body, :style, :title, :description,
            :keywords, :canonical_url, :picture, :meta, :lang).merge(lang_ver_urls: urls
          ).deep_transform_keys { |key| key.to_s.camelize(:lower) },
          lang: page.lang
        )
      end

      if is_ssr
        user_data = {
          'authorized' => false,
          'account_type' => nil,
          'first_name' => nil,
          'business_name' => nil,
          'role' => nil
        }

        @user ||= ::Queries::User::SingleByAccessToken.new( access_token: access_token, site_name: 'Warsawlease' ).call

        authorized = @user.present?
        if authorized
          user_data.merge!(@user&.attributes&.slice('account_type', 'first_name', 'business_name', 'role')).merge!('authorized' => true)
        end

        state.merge!(
          'user/authorize/data': user_data.deep_transform_keys { |key| key.to_s.camelize(:lower) },
          'assets/svgs': SvgsSerializer.new(site: 'Warsawlease').serialize
        )
      end

      response = {
        metaData: meta.deep_transform_keys { |key| key.to_s.camelize(:lower) },
        state: state
      }

      render json: response.as_json
    end
  end
end

def account_type_specific_attributes
  if @user.professional_account?
    return {
      business_name: @user.business_name,
      tax_number: @user.tax_number
    }
  end

  {
    first_name: @user.first_name,
    last_name: @user.last_name
  }
end
