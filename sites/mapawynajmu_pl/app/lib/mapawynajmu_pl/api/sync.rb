# frozen_string_literal: true

module MapawynajmuPl
  module Api
    class Sync < ::Api::Sync
      helpers do
        def track_paths
          {
            ::MapawynajmuPl::Api::Tracks::Root::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Root::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::Announcement::Create::Form::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Announcement::Create::Form::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::Visitor::Contact::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Visitor::Contact::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Visitor::PrivacySettings::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::User::Create::Form::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::User::Create::Form::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::User::Create::Verification::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::User::Create::Verification::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::Announcement::Index::User::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Announcement::Index::User::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::User::Edit::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::User::Edit::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::User::Authorize::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::User::Authorize::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::Announcement::Create::Summary::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Announcement::Create::Summary::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::Announcement::Show::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Announcement::Show::Meta::UNLOCALIZED_PATH,
            ::MapawynajmuPl::Api::Tracks::Announcement::Edit::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Announcement::Edit::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::New::Meta::TRACK => ::Api::Tracks::Page::New::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::Index::Manage::Meta::TRACK => ::Api::Tracks::Page::Index::Manage::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::Edit::Meta::TRACK => ::Api::Tracks::Page::Edit::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Image::Edit::Meta::TRACK => ::Api::Tracks::Image::Edit::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Image::Create::Meta::TRACK => ::Api::Tracks::Image::Create::Meta::UNLOCALIZED_PATH
          }
        end

        def append_track_data
          case track
          when ::MapawynajmuPl::Api::Tracks::Root::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::Root::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::Visitor::Contact::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::Visitor::Contact::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::Visitor::PrivacySettings::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::User::Create::Form::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::User::Create::Form::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::User::Create::Verification::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::User::Create::Verification::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::User::Edit::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::User::Edit::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::User::Authorize::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::User::Authorize::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::Announcement::Create::Form::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::Announcement::Create::Form::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::Announcement::Index::User::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::Announcement::Index::User::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::Announcement::Create::Summary::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::Announcement::Create::Summary::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::Announcement::Show::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::Announcement::Show::Appender.new(attrs).call
          when ::MapawynajmuPl::Api::Tracks::Announcement::Edit::Meta::TRACK then ::MapawynajmuPl::Api::Tracks::Announcement::Edit::Appender.new(attrs).call
          when ::Api::Tracks::Page::New::Meta::TRACK then ::Api::Tracks::Page::New::Appender.new(attrs).call
          when ::Api::Tracks::Page::Index::Manage::Meta::TRACK then ::Api::Tracks::Page::Index::Manage::Appender.new(attrs).call
          when ::Api::Tracks::Page::Show::Meta::TRACK then ::Api::Tracks::Page::Show::Appender.new(**attrs, page: page).call
          when ::Api::Tracks::Page::Edit::Meta::TRACK then ::Api::Tracks::Page::Edit::Appender.new(attrs).call
          when ::Api::Tracks::Page::NotFound::Meta::TRACK then ::Api::Tracks::Page::NotFound::Appender.new(attrs).call
          when ::Api::Tracks::Redirect::Show::Meta::TRACK then ::Api::Tracks::Redirect::Show::Appender.new(attrs).call
          when ::Api::Tracks::Image::Edit::Meta::TRACK then ::Api::Tracks::Image::Edit::Appender.new(attrs).call
          when ::Api::Tracks::Image::Create::Meta::TRACK then ::Api::Tracks::Image::Create::Appender.new(attrs).call
          end
        end

        def append_links
          links = state[:links] || {}
          state[:links] = links.merge(
            ::MapawynajmuPl::Api::Tracks::Root::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Root::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::Visitor::Contact::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Visitor::Contact::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Visitor::PrivacySettings::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::User::Create::Form::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::User::Create::Form::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::User::Create::Verification::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::User::Create::Verification::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::User::Edit::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::User::Edit::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::User::ResetPassword::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::User::Authorize::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::User::Authorize::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::User::Show::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::User::Show::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::Announcement::Create::Form::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Announcement::Create::Form::Linker.new(lang).call,
            ::MapawynajmuPl::Api::Tracks::Announcement::Index::User::Meta::TRACK => ::MapawynajmuPl::Api::Tracks::Announcement::Index::User::Linker.new(lang).call,
            ::Api::Tracks::Page::New::Meta::TRACK => ::Api::Tracks::Page::New::Linker.new(:pl).call,
            ::Api::Tracks::Page::Index::Manage::Meta::TRACK => ::Api::Tracks::Page::Index::Manage::Linker.new(:pl).call,
            ::Api::Tracks::Image::Edit::Meta::TRACK => ::Api::Tracks::Image::Edit::Linker.new(lang).call,
            ::Api::Tracks::Image::Create::Meta::TRACK => ::Api::Tracks::Image::Create::Linker.new(lang).call
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
