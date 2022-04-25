# frozen_string_literal: true

module SoundofIt
  module Api
    class Sync < ::Api::Sync
      helpers do
        def track_paths
          {
            ::SoundofIt::Api::Tracks::Root::Meta::TRACK => ::SoundofIt::Api::Tracks::Root::Meta::UNLOCALIZED_PATH,
            ::SoundofIt::Api::Tracks::Visitor::Contact::Meta::TRACK => ::SoundofIt::Api::Tracks::Visitor::Contact::Meta::UNLOCALIZED_PATH,
            ::SoundofIt::Api::Tracks::Visitor::TermsOfService::Meta::TRACK => ::SoundofIt::Api::Tracks::Visitor::TermsOfService::Meta::UNLOCALIZED_PATH,
            ::SoundofIt::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK => ::SoundofIt::Api::Tracks::Visitor::PrivacyPolicy::Meta::UNLOCALIZED_PATH,
            ::SoundofIt::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK => ::SoundofIt::Api::Tracks::Visitor::CookiesPolicy::Meta::UNLOCALIZED_PATH,
            ::SoundofIt::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK => ::SoundofIt::Api::Tracks::Visitor::PrivacySettings::Meta::UNLOCALIZED_PATH,
            ::SoundofIt::Api::Tracks::Announcement::Create::Form::Meta::TRACK => ::SoundofIt::Api::Tracks::Announcement::Create::Form::Meta::UNLOCALIZED_PATH,
            ::SoundofIt::Api::Tracks::Announcement::Create::Summary::Meta::TRACK => ::SoundofIt::Api::Tracks::Announcement::Create::Summary::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::New::Meta::TRACK => ::Api::Tracks::Page::New::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::Index::Manage::Meta::TRACK => ::Api::Tracks::Page::Index::Manage::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::Edit::Meta::TRACK => ::Api::Tracks::Page::Edit::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Image::Edit::Meta::TRACK => ::Api::Tracks::Image::Edit::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Image::Index::Meta::TRACK => ::Api::Tracks::Image::Index::Meta::UNLOCALIZED_PATH
          }
        end

        def append_track_data
          case track
          when ::SoundofIt::Api::Tracks::Root::Meta::TRACK then ::SoundofIt::Api::Tracks::Root::Appender.new(attrs).call
          when ::SoundofIt::Api::Tracks::Visitor::Contact::Meta::TRACK then ::SoundofIt::Api::Tracks::Visitor::Contact::Appender.new(attrs).call
          when ::SoundofIt::Api::Tracks::Visitor::TermsOfService::Meta::TRACK then ::SoundofIt::Api::Tracks::Visitor::TermsOfService::Appender.new(attrs).call
          when ::SoundofIt::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK then ::SoundofIt::Api::Tracks::Visitor::PrivacyPolicy::Appender.new(attrs).call
          when ::SoundofIt::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK then ::SoundofIt::Api::Tracks::Visitor::CookiesPolicy::Appender.new(attrs).call
          when ::SoundofIt::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK then ::SoundofIt::Api::Tracks::Visitor::PrivacySettings::Appender.new(attrs).call
          when ::SoundofIt::Api::Tracks::Announcement::Create::Form::Meta::TRACK then ::SoundofIt::Api::Tracks::Announcement::Create::Form::Appender.new(attrs).call
          when ::SoundofIt::Api::Tracks::Announcement::Create::Summary::Meta::TRACK then ::SoundofIt::Api::Tracks::Announcement::Create::Summary::Appender.new(attrs).call
          when ::Api::Tracks::Page::New::Meta::TRACK then ::Api::Tracks::Page::New::Appender.new(attrs).call
          when ::Api::Tracks::Page::Index::Manage::Meta::TRACK then ::Api::Tracks::Page::Index::Manage::Appender.new(attrs).call
          when ::Api::Tracks::Page::Show::Meta::TRACK then ::Api::Tracks::Page::Show::Appender.new(**attrs, page: page).call
          when ::Api::Tracks::Page::Edit::Meta::TRACK then ::Api::Tracks::Page::Edit::Appender.new(attrs).call
          when ::Api::Tracks::Page::NotFound::Meta::TRACK then ::Api::Tracks::Page::NotFound::Appender.new(attrs).call
          when ::Api::Tracks::Redirect::Show::Meta::TRACK then ::Api::Tracks::Redirect::Show::Appender.new(attrs).call
          when ::Api::Tracks::Image::Edit::Meta::TRACK then ::Api::Tracks::Image::Edit::Appender.new(attrs).call
          when ::Api::Tracks::Image::Index::Meta::TRACK then ::Api::Tracks::Image::Index::Appender.new(attrs).call
          end
        end

        def append_links
          links = state[:links] || {}
          state[:links] = links.merge(
            ::SoundofIt::Api::Tracks::Root::Meta::TRACK => ::SoundofIt::Api::Tracks::Root::Linker.new(lang).call,
            ::SoundofIt::Api::Tracks::Visitor::Contact::Meta::TRACK => ::SoundofIt::Api::Tracks::Visitor::Contact::Linker.new(lang).call,
            ::SoundofIt::Api::Tracks::Visitor::TermsOfService::Meta::TRACK => ::SoundofIt::Api::Tracks::Visitor::TermsOfService::Linker.new(lang).call,
            ::SoundofIt::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK => ::SoundofIt::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(lang).call,
            ::SoundofIt::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK => ::SoundofIt::Api::Tracks::Visitor::CookiesPolicy::Linker.new(lang).call,
            ::SoundofIt::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK => ::SoundofIt::Api::Tracks::Visitor::PrivacySettings::Linker.new(lang).call,
            ::SoundofIt::Api::Tracks::Announcement::Create::Form::Meta::TRACK => ::SoundofIt::Api::Tracks::Announcement::Create::Form::Linker.new(lang).call,
            ::SoundofIt::Api::Tracks::Announcement::Create::Summary::Meta::TRACK => ::SoundofIt::Api::Tracks::Announcement::Create::Summary::Linker.new(lang).call,
            ::Api::Tracks::Page::New::Meta::TRACK => ::Api::Tracks::Page::New::Linker.new(lang).call,
            ::Api::Tracks::Page::Index::Manage::Meta::TRACK => ::Api::Tracks::Page::Index::Manage::Linker.new(lang).call,
            ::Api::Tracks::Image::Edit::Meta::TRACK => ::Api::Tracks::Image::Edit::Linker.new(lang).call,
            ::Api::Tracks::Image::Index::Meta::TRACK => ::Api::Tracks::Image::Index::Linker.new(lang).call
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
