# frozen_string_literal: true

module Codelumi
  module Api
    class Sync < ::Api::Sync
      helpers do
        def append_links
          links = state[:links] || {}
          state[:links] = links.merge(
            'root': ::Codelumi::Api::Tracks::Root::Linker.new(lang).call,
            'visitor/contact': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/contact', unlocalized_title: ::Codelumi::Api::Visitor::Tracks::Contact::Meta::UNLOCALIZED_TITLE).call,
            'visitor/terms-of-service': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/terms-of-service', unlocalized_title: ::Codelumi::Api::Visitor::Tracks::TermsOfService::Meta::UNLOCALIZED_TITLE).call,
            'visitor/privacy-policy': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/privacy-policy', unlocalized_title: ::Codelumi::Api::Visitor::Tracks::PrivacyPolicy::Meta::UNLOCALIZED_TITLE).call,
            'visitor/cookies-policy': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/cookies-policy', unlocalized_title: ::Codelumi::Api::Visitor::Tracks::CookiesPolicy::Meta::UNLOCALIZED_TITLE).call,
            'visitor/privacy-settings': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/privacy-settings', unlocalized_title: ::Codelumi::Api::Visitor::Tracks::PrivacySettings::Meta::UNLOCALIZED_TITLE).call
          )
        end

        def link_attrs
          { site: site, lang: lang }
        end

        def append_track_data
          case track
          when 'root'
            ::Codelumi::Api::Tracks::Root::Appender.new(attrs).call
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
