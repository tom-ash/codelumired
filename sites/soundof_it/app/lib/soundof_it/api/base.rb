# frozen_string_literal: true

module SoundofIt
  module Api
    class Base < ::Api::Base
      helpers do
        def constantized_site_name
          @constantized_site_name ||= SOUNDOF_IT_NAME_CONSTANTIZED_NAME
        end

        def langs
          @langs ||= SOUNDOF_IT_NAME_LANGS
        end

        def sitemaps
          [
            ::SoundofIt::Api::Tracks::Root::Sitemap,
            ::SoundofIt::Api::Tracks::Visitor::Contact::Sitemap,
            ::SoundofIt::Api::Tracks::Visitor::TermsOfService::Sitemap,
            ::SoundofIt::Api::Tracks::Visitor::CookiesPolicy::Sitemap,
            ::SoundofIt::Api::Tracks::Visitor::PrivacyPolicy::Sitemap,
            ::SoundofIt::Api::Tracks::Visitor::PrivacySettings::Sitemap
          ]
        end

        def bucket
          @bucket ||= ENV['AWS_S3_SOUNDOFIT_BUCKET']
        end
      end

      mount ::Api::Sitemap => 'sitemap'
      mount ::SoundofIt::Api::Sync => 'sync'
      mount ::SoundofIt::Api::Methods::Announcement::Create::AsUser => 'job/create/as-user'
    end
  end
end
