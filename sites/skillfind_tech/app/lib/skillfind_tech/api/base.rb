# frozen_string_literal: true

module SkillfindTech
  module Api
    class Base < ::Api::Base
      helpers do
        def site_name
          @site_name ||= SKILLFIND_TECH_NAME
        end

        def constantized_site_name
          @constantized_site_name ||= SKILLFIND_TECH_NAME_CONSTANTIZED_NAME
        end

        def organizationName
          @organizationName ||= SKILLFIND_TECH_NAME
        end

        def image
          @image ||= SKILLFIND_TECH_IMAGE
        end

        def domain_url
          @domain_url ||= Rails.env.production? ? SKILLFIND_TECH_URL : SKILLFIND_TECH_URL_DEV
        end

        def index_now_key
          ENV['SKILLFIND_TECH_INDEX_NOW_KEY']
        end

        def api_url
          @api_url ||= Rails.env.production? ? SKILLFIND_TECH_API_URL : SKILLFIND_TECH_API_URL_DEV
        end

        def langs
          @langs ||= SKILLFIND_TECH_NAME_LANGS
        end

        def sitemaps
          [
            ::SkillfindTech::Api::Tracks::Root::Sitemap,
            ::SkillfindTech::Api::Tracks::Visitor::Contact::Sitemap,
            ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Sitemap,
            ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Sitemap,
            ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Sitemap,
            ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Sitemap,
            ::SkillfindTech::Api::Tracks::Questions::Show::Sitemap
          ]
        end

        def bucket
          @bucket ||= SKILLFIND_TECH_AWS_S3_BUCKET
        end
      end

      mount ::Api::Sitemap => 'sitemap'
      mount ::SkillfindTech::Api::Sync => 'sync'
      mount ::SkillfindTech::Api::Methods::Users => 'users'
      mount ::SkillfindTech::Api::Methods::Postings => 'postings'
      mount ::SkillfindTech::Api::Methods::Assets => 'assets'
      mount ::SkillfindTech::Api::Methods::Questions => 'questions'
      mount ::SkillfindTech::Api::Methods::Redirects => 'redirects'
    end
  end
end
