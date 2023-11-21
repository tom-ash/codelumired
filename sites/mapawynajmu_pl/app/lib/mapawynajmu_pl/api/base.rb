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

        def organizationName
          @organizationName ||= MAPAWYNAJMU_PL_NAME
        end

        def domain_url
          @domain_url ||= Rails.env.production? ? MAPAWYNAJMU_PL_URL : MAPAWYNAJMU_PL_URL_DEV
        end

        def index_now_key
          ENV['MAPAWYNAJMU_PL_INDEX_NOW_KEY']
        end

        def api_url
          @api_url ||= Rails.env.production? ? MAPAWYNAJMU_PL_API_URL : MAPAWYNAJMU_PL_API_URL_DEV
        end

        def image
          @image ||= MAPAWYNAJMU_PL_IMAGE
        end

        def langs
          @langs ||= MAPAWYNAJMU_PL_NAME_LANGS
        end

        def current_announcement
          id = params[:id] || route_url.match(/(\d+)-.*-(na-wynajem|for-(rent|lease)).*$/)[1]
          @current_announcement ||= ::MapawynajmuPl::Listing.find(id)
        end

        def authorize_for_announcement!
          error!('Unauthorized!.', 401) unless authenticated_user&.id == current_announcement.user_id
        end

        def sitemaps
          [
            ::MapawynajmuPl::Api::Tracks::Root::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Listing::Create::Form::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Listing::Show::Sitemap,
            ::MapawynajmuPl::Api::Tracks::User::Create::Form::Sitemap,
            ::MapawynajmuPl::Api::Tracks::User::Authorize::Sitemap,
            ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Visitor::Contact::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Sitemap,
            ::MapawynajmuPl::Api::Tracks::Visitor::PrivacySettings::Sitemap,
          ]
        end

        def bucket
          @bucket ||= MAPAWYNAJMU_PL_S3
        end
      end

      mount ::Api::Sitemap => 'sitemap'
      mount ::MapawynajmuPl::Api::Sync => 'sync'
      mount ::MapawynajmuPl::Api::Listing::Create::AsUser => 'announcement/create/as-user'
      mount ::MapawynajmuPl::Api::Listing::Create::WithUser => 'announcement/create/with-user'
      mount ::MapawynajmuPl::Api::Listing::GetPhoneNumber => 'announcement/get-phone-number/:id'
      mount ::MapawynajmuPl::Api::Listing::Update::Form => 'announcement/update/form/:id'
      mount ::MapawynajmuPl::Api::Listing::Update::ActiveUntil => 'announcement/update/active-until/:id'
      mount ::MapawynajmuPl::Api::Listing::Update::Visible => 'announcement/update/visible/:id'
      mount ::MapawynajmuPl::Api::Listing::Update::Views => 'announcement/update/views/:id'
      mount ::MapawynajmuPl::Api::Listing::Delete => 'announcement/delete/:id'
      mount ::MapawynajmuPl::Api::Orders::Notify => 'orders/notify'
      mount ::MapawynajmuPl::Api::Methods::Listings => 'listings'
      mount ::MapawynajmuPl::Api::Methods::Assets => 'assets'
      mount ::MapawynajmuPl::Api::Methods::Redirects => 'redirects'
    end
  end
end
