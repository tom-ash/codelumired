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
              ::Warsawlease::Api::Tracks::Root::Meta::TRACK => ::Warsawlease::Api::Tracks::Root::Linker.new(lang).call,
              ::Warsawlease::Api::Tracks::Announcement::Catalogue::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Catalogue::Linker.new(lang).call,
              ::Warsawlease::Api::Tracks::Announcement::Create::Form::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Create::Form::Linker.new(lang).call,
              ::Warsawlease::Api::Tracks::Visitor::Contact::Meta::TRACK => ::Warsawlease::Api::Tracks::Visitor::Contact::Linker.new(lang).call,
              'visitor/terms-of-service': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/terms-of-service', unlocalized_title: ::Warsawlease::Api::Visitor::Tracks::TermsOfService::Meta::UNLOCALIZED_TITLE).call,
              'visitor/privacy-policy': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/privacy-policy', unlocalized_title: ::Warsawlease::Api::Visitor::Tracks::PrivacyPolicy::Meta::UNLOCALIZED_TITLE).call,
              'visitor/cookies-policy': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/cookies-policy', unlocalized_title: ::Warsawlease::Api::Visitor::Tracks::CookiesPolicy::Meta::UNLOCALIZED_TITLE).call,
              'visitor/privacy-settings': ::Api::Visitor::Links::Build.new(**link_attrs, track: 'visitor/privacy-settings', unlocalized_title: ::Warsawlease::Api::Visitor::Tracks::PrivacySettings::Meta::UNLOCALIZED_TITLE).call,
              ::Warsawlease::Api::Tracks::User::Create::Form::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Create::Form::Linker.new(lang).call,
              ::Warsawlease::Api::Tracks::User::Create::Verification::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Create::Verification::Linker.new(lang).call,
              ::Warsawlease::Api::Tracks::User::Edit::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Edit::Linker.new(lang).call,
              ::Warsawlease::Api::Tracks::User::ResetPassword::Meta::TRACK => ::Warsawlease::Api::Tracks::User::ResetPassword::Linker.new(lang).call,
              ::Warsawlease::Api::Tracks::User::Authorize::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Authorize::Linker.new(lang).call,
              ::Warsawlease::Api::Tracks::User::Show::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Show::Linker.new(lang).call,
              ::Warsawlease::Api::Tracks::Announcement::Index::User::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Index::User::Linker.new(lang).call,
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
