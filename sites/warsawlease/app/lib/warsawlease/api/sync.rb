# frozen_string_literal: true

module Warsawlease
  module Api
    class Sync < ::Api::Sync
      helpers Warsawlease::Api::Announcement::Helpers::Tracks
      helpers Warsawlease::Api::Announcement::Helpers::Filters

      helpers do
        def track_data
          @track_data ||= JSON.parse(File.read('./sites/warsawlease/app/tracks/meta_data.json'))
        end

        def append_links
          state.merge!(
            links: {
              'root': ::Warsawlease::Api::Announcement::Links::Root::Build.new(lang).call,
              'announcement/create': ::Warsawlease::Api::Announcement::Links::Create::Build.new(lang).call,
              'visitor/contact': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/contact', unlocalized_title: ::Warsawlease::Api::Visitor::Tracks::Contact::Meta::UNLOCALIZED_TITLE).call,
              'visitor/terms-of-service': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/terms-of-service', unlocalized_title: ::Warsawlease::Api::Visitor::Tracks::TermsOfService::Meta::UNLOCALIZED_TITLE).call,
              'visitor/privacy-policy': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/privacy-policy', unlocalized_title: ::Warsawlease::Api::Visitor::Tracks::PrivacyPolicy::Meta::UNLOCALIZED_TITLE).call,
              'visitor/cookies-policy': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/cookies-policy', unlocalized_title: ::Warsawlease::Api::Visitor::Tracks::CookiesPolicy::Meta::UNLOCALIZED_TITLE).call,
              'visitor/privacy-settings': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/privacy-settings', unlocalized_title: ::Warsawlease::Api::Visitor::Tracks::PrivacySettings::Meta::UNLOCALIZED_TITLE).call
            }
          )
        end

        def link_attrs
          { site: site, lang: lang, root_domain: root_domain }
        end
      end

      before do
        handle_announcement_tracks
        append_links
      end
    end
  end
end
