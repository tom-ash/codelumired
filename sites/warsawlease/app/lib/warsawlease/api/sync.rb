# frozen_string_literal: true

module Warsawlease
  module Api
    class Sync < ::Api::Sync
      helpers Warsawlease::Api::Announcement::Helpers::Tracks
      helpers Warsawlease::Api::Announcement::Helpers::Filters

      helpers do
        def tracks
          {
            ::Warsawlease::Api::Tracks::Root::Meta::TRACK => ::Warsawlease::Api::Tracks::Root::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Announcement::Create::Form::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Create::Form::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Visitor::Contact::Meta::TRACK => ::Warsawlease::Api::Tracks::Visitor::Contact::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Visitor::TermsOfService::Meta::TRACK => ::Warsawlease::Api::Tracks::Visitor::TermsOfService::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK => ::Warsawlease::Api::Tracks::Visitor::PrivacyPolicy::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK => ::Warsawlease::Api::Tracks::Visitor::CookiesPolicy::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK => ::Warsawlease::Api::Tracks::Visitor::PrivacySettings::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::User::Create::Form::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Create::Form::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::User::Create::Verification::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Create::Verification::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Announcement::Index::User::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Index::User::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::User::Edit::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Edit::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Announcement::Create::Summary::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Create::Summary::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Announcement::Show::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Show::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Announcement::Edit::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Edit::Meta::UNLOCALIZED_PATH
          }
        end

        def append_links
          links = state[:links] || {}
          state[:links] = links.merge(
            ::Warsawlease::Api::Tracks::Root::Meta::TRACK => ::Warsawlease::Api::Tracks::Root::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::Announcement::Create::Form::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Create::Form::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::Visitor::Contact::Meta::TRACK => ::Warsawlease::Api::Tracks::Visitor::Contact::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::Visitor::TermsOfService::Meta::TRACK => ::Warsawlease::Api::Tracks::Visitor::TermsOfService::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK => ::Warsawlease::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK => ::Warsawlease::Api::Tracks::Visitor::CookiesPolicy::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK => ::Warsawlease::Api::Tracks::Visitor::PrivacySettings::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::User::Create::Form::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Create::Form::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::User::Create::Verification::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Create::Verification::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::User::Edit::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Edit::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::User::ResetPassword::Meta::TRACK => ::Warsawlease::Api::Tracks::User::ResetPassword::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::User::Authorize::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Authorize::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::User::Show::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Show::Linker.new(lang).call,
            ::Warsawlease::Api::Tracks::Announcement::Index::User::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Index::User::Linker.new(lang).call,
          )
        end
      end

      before do
        handle_announcement_tracks
        append_links
      end
    end
  end
end
