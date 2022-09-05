# frozen_string_literal: true

module MapawynajmuPl
  module Api
    class Base < ::Api::Base
      helpers do
        def site_name
          @site_name ||= MAPAWYNAJMU_PL_NAME
        end

        def constantized_site_name
          @constantized_site_name ||= MAPAWYNAJMU_PL_CONSTANTIZED_NAME
        end

        def domain_url
          @domain_url ||= MAPAWYNAJMU_PL_URL
        end

        def image
          @image ||= MAPAWYNAJMU_PL_IMAGE
        end

        def langs
          @langs ||= MAPAWYNAJMU_PL_NAME_LANGS
        end

        def current_announcement
          id = params[:id] || route_url.match(/(\d+)-.*-(na-wynajem|for-lease).*$/)[1]
          @current_announcement ||= ::MapawynajmuPl::Announcement.find(id)
        end

        def authorize_for_announcement!
          error!('Unauthorized!.', 401) unless current_user&.id == current_announcement.user_id
        end

        def sitemaps
          [
            ::MapawynajmuPl::Api::Tracks::Root::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Announcement::Create::Form::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Announcement::Show::Sitemap,
            ::MapawynajmuPl::Api::Tracks::User::Create::Form::Sitemap,
            ::MapawynajmuPl::Api::Tracks::User::Authorize::Sitemap,
            ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Visitor::Contact::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Visitor::PrivacySettings::Sitemap
          ]
        end

        def bucket
          @bucket ||= ENV['AWS_S3_MAPAWYNAJMUPL_BUCKET']
        end
      end

      mount ::Api::Sitemap => 'sitemap'
      mount ::MapawynajmuPl::Api::Sync => 'sync'
      mount ::MapawynajmuPl::Api::Announcement::Create::AsUser => 'announcement/create/as-user'
      mount ::MapawynajmuPl::Api::Announcement::Create::WithUser => 'announcement/create/with-user'
      mount ::MapawynajmuPl::Api::Announcement::GetTile => 'announcement/get-tile/:id'
      mount ::MapawynajmuPl::Api::Announcement::GetPhoneNumber => 'announcement/get-phone-number/:id'
      mount ::MapawynajmuPl::Api::Announcement::Update::Form => 'announcement/update/form/:id'
      mount ::MapawynajmuPl::Api::Announcement::Update::ActiveUntil => 'announcement/update/active-until/:id'
      mount ::MapawynajmuPl::Api::Announcement::Update::Visible => 'announcement/update/visible/:id'
      mount ::MapawynajmuPl::Api::Announcement::Update::Views => 'announcement/update/views/:id'
      mount ::MapawynajmuPl::Api::Announcement::Delete => 'announcement/delete/:id'
    end
  end
end
