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

        def image
          @image ||= SKILLFIND_TECH_IMAGE
        end

        def domain_url
          @domain_url ||= SKILLFIND_TECH_URL
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
            ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Sitemap
          ]
        end

        def bucket
          @bucket ||= ENV['AWS_S3_SkillfindTech_BUCKET']
        end
      end

      mount ::Api::Sitemap => 'sitemap'
      mount ::SkillfindTech::Api::Sync => 'sync'
      mount ::SkillfindTech::Api::Methods::Users => 'users'
      mount ::SkillfindTech::Api::Methods::Job::Create::AsUser => 'job/create/as-user'
    end
  end
end
