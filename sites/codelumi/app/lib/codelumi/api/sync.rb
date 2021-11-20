# frozen_string_literal: true

module Codelumi
  module Api
    class Sync < ::Api::Sync
      helpers do
        def track_data
          {
            root: {
              en: {
                title: 'Code, Light & People | soundof.IT',
                description: 'Resources on coding in JavaScript, Ruby, Python, SQL and other.',
                keywords: 'code, coding, programming, dev, it, javascript, ruby, python, sql, docker'
              }
            }
          }
        end

        def append_links
          state.merge!(
            links: {
              'visitor/contact': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/contact', unlocalized_title: ::Codelumi::Api::Visitor::Tracks::Contact::Meta::UNLOCALIZED_TITLE).call,
              'visitor/terms-of-service': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/terms-of-service', unlocalized_title: ::Codelumi::Api::Visitor::Tracks::TermsOfService::Meta::UNLOCALIZED_TITLE).call,
              'visitor/privacy-policy': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/privacy-policy', unlocalized_title: ::Codelumi::Api::Visitor::Tracks::PrivacyPolicy::Meta::UNLOCALIZED_TITLE).call,
              'visitor/cookies-policy': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/cookies-policy', unlocalized_title: ::Codelumi::Api::Visitor::Tracks::CookiesPolicy::Meta::UNLOCALIZED_TITLE).call,
              'visitor/privacy-settings': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/privacy-settings', unlocalized_title: ::Codelumi::Api::Visitor::Tracks::PrivacySettings::Meta::UNLOCALIZED_TITLE).call
            }
          )
        end

        def link_attrs
          { site: site, lang: lang, root_domain: root_domain }
        end

        def root_domain
          return 'http://local.soundof.it:8080' if Rails.env == 'development'

          'https://soundof.it'
        end

        def append_track_data
          case track
          when 'visitor/contact'
            ::Codelumi::Api::Visitor::Tracks::Contact::Merge.new(attrs).call
          when 'visitor/terms-of-service'
            ::Codelumi::Api::Visitor::Tracks::TermsOfService::Merge.new(attrs).call
          when 'visitor/privacy-policy'
            ::Codelumi::Api::Visitor::Tracks::PrivacyPolicy::Merge.new(attrs).call
          when 'visitor/cookies-policy'
            ::Codelumi::Api::Visitor::Tracks::CookiesPolicy::Merge.new(attrs).call
          when 'visitor/privacy-settings'
            ::Codelumi::Api::Visitor::Tracks::PrivacySettings::Merge.new(attrs).call
          end
        end
      end

      before do
        append_links
        append_track_data
      end
    end
  end
end
