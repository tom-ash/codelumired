# frozen_string_literal: true

module Warsawlease
  module Api
    class Sync < ::Api::Sync
      helpers Warsawlease::Api::Announcement::Helpers::Filters

      helpers do
        def track_paths
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
            ::Warsawlease::Api::Tracks::User::ResetPassword::Meta::TRACK => ::Warsawlease::Api::Tracks::User::ResetPassword::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::User::Authorize::Meta::TRACK => ::Warsawlease::Api::Tracks::User::Authorize::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Announcement::Create::Summary::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Create::Summary::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Announcement::Show::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Show::Meta::UNLOCALIZED_PATH,
            ::Warsawlease::Api::Tracks::Announcement::Edit::Meta::TRACK => ::Warsawlease::Api::Tracks::Announcement::Edit::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::New::Meta::TRACK => ::Api::Tracks::Page::New::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::Index::Manage::Meta::TRACK => ::Api::Tracks::Page::Index::Manage::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::Edit::Meta::TRACK => ::Api::Tracks::Page::Edit::Meta::UNLOCALIZED_PATH,
          }
        end

        def append_track_data
          case track
          when ::Warsawlease::Api::Tracks::Root::Meta::TRACK then ::Warsawlease::Api::Tracks::Root::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::Visitor::Contact::Meta::TRACK then ::Warsawlease::Api::Tracks::Visitor::Contact::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::Visitor::TermsOfService::Meta::TRACK then ::Warsawlease::Api::Tracks::Visitor::TermsOfService::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK then ::Warsawlease::Api::Tracks::Visitor::PrivacyPolicy::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK then ::Warsawlease::Api::Tracks::Visitor::CookiesPolicy::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK then ::Warsawlease::Api::Tracks::Visitor::PrivacySettings::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::User::Create::Form::Meta::TRACK then ::Warsawlease::Api::Tracks::User::Create::Form::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::User::Create::Verification::Meta::TRACK then ::Warsawlease::Api::Tracks::User::Create::Verification::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::User::Edit::Meta::TRACK then ::Warsawlease::Api::Tracks::User::Edit::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::User::ResetPassword::Meta::TRACK then ::Warsawlease::Api::Tracks::User::ResetPassword::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::User::Authorize::Meta::TRACK then ::Warsawlease::Api::Tracks::User::Authorize::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::Announcement::Create::Form::Meta::TRACK then ::Warsawlease::Api::Tracks::Announcement::Create::Form::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::Announcement::Index::User::Meta::TRACK then ::Warsawlease::Api::Tracks::Announcement::Index::User::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::Announcement::Create::Summary::Meta::TRACK then ::Warsawlease::Api::Tracks::Announcement::Create::Summary::Appender.new(**attrs, current_announcement: current_announcement).call
          when ::Warsawlease::Api::Tracks::Announcement::Show::Meta::TRACK then ::Warsawlease::Api::Tracks::Announcement::Show::Appender.new(attrs).call
          when ::Warsawlease::Api::Tracks::Announcement::Edit::Meta::TRACK then ::Warsawlease::Api::Tracks::Announcement::Edit::Appender.new(attrs).call
          when ::Api::Tracks::Page::New::Meta::TRACK then ::Api::Tracks::Page::New::Appender.new(attrs).call
          when ::Api::Tracks::Page::Index::Manage::Meta::TRACK then ::Api::Tracks::Page::Index::Manage::Appender.new(attrs).call
          when ::Api::Tracks::Page::Show::Meta::TRACK then ::Api::Tracks::Page::Show::Appender.new(**attrs, page: page).call
          when ::Api::Tracks::Page::Edit::Meta::TRACK then ::Api::Tracks::Page::Edit::Appender.new(attrs).call
          end
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
            ::Api::Tracks::Page::New::Meta::TRACK => ::Api::Tracks::Page::New::Linker.new(:pl).call,
            ::Api::Tracks::Page::Index::Manage::Meta::TRACK => ::Api::Tracks::Page::Index::Manage::Linker.new(:pl).call,
          )
        end
      end

      before do
        append_track_data
        append_links
      end
    end
  end
end
