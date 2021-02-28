module Warsawlease
  class RouteDataController < Warsawlease::ApplicationController
    include Sites
    include Responses
    include AnnouncementsIndex
    include AnnouncementsShared
    include UsersAuthorize
    include UsersShow
    include UsersVerify
    include UsersCiphers

    def serialize_announcements(announcements)
      announcements.map do |announcement|
        announcement.attributes.deep_transform_keys { |key| key.to_s.camelize(:lower) }
      end
    end

    def show
      route_url = request.headers['Route-Url']
      track = request.headers['Track']
      state = {}
      meta = {}
      is_ssr = request.headers['Type'] == 'ssr'
      lang = request.headers['Lang']
      page_name = request.headers['Page-Name']

      if ['root', 'announcement/index/catalogue'].include?(track)
        search_announcements

        state.merge!(
          'announcement/index/data': {
            announcements: serialize_announcements(@announcements),
            amount: @announcements.count
          }
        )
      end

      if track == 'announcement/index/my'
        return bad_request unless user_validated?

        prepare_announcements
        limit_announcements
        sort_announcements
        select_attributes

        state.merge!(
          'announcement/index/data': {
            announcements: serialize_announcements(@announcements),
            amount: @announcements.count
          }
        )
      end

      if route_url.match(/(\d+)-.*-(na-wynajem-warszawa|for-lease-warsaw)-.*$/)
        # TODO: REWRITE TO SERVICE BEGIN
        @announcement = Announcement.find_by(id: $1)
        return render_404 unless @announcement&.visible?

        @attributes = @announcement.attributes.slice(*AnnouncementsAttributes::SHOW_FULL)
        user = @announcement.user
        @announcement.user_id = nil
        @attributes = @attributes.as_json.with_indifferent_access
        parse_availability_date
        @attributes[:name] = user.showcase['name']
        @attributes[:phone] = user.showcase['phone']
        state.merge!(
          'announcement/show/data': @attributes.deep_transform_keys { |key| key.to_s.camelize(:lower) }
        )
        # TODO: REWRITE TO SERVICE END

        meta = {
          title: { category: @attributes[:category], district: @attributes[:district], area: @attributes[:area] },
          description: { pl: @attributes[:polish_description], en: @attributes[:english_description] },
          keywords: { category: @attributes[:category], district: @attributes[:district] },
          image: { imageKey: "announcements/#{@attributes[:id]}/#{@attributes[:pictures][0]['database']}" }
        }
      end

      if track == 'user/edit'
        return bad_request unless user_validated?

        state.merge!(
          'user/edit/data': {
            phone_code: @user.phone['code'],
            phone_body: @user.phone['body'],
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
        state.merge!(
          'page/create/data': { names: Page.all.pluck(:name).uniq.sort }
        )
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
          title: page.title,
          description: page.description,
          keywords: page.keywords,
          canonical_url: page.canonical_url,
          picture: page.picture,
          lang: page.lang
        }

        state.merge!(
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
        user_validated?
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
