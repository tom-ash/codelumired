# frozen_string_literal: true

module SkillfindTech
  module Api
    class Sync < ::Api::Sync
      helpers do
        def track_paths
          {
            ::SkillfindTech::Api::Tracks::Root::Meta::TRACK => ::SkillfindTech::Api::Tracks::Root::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Visitor::Contact::Meta::TRACK => ::SkillfindTech::Api::Tracks::Visitor::Contact::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Meta::TRACK => ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK => ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK => ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK => ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::User::New::Form::Meta::TRACK => ::SkillfindTech::Api::Tracks::User::New::Form::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Announcement::Create::Form::Meta::TRACK => ::SkillfindTech::Api::Tracks::Announcement::Create::Form::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Announcement::Create::Summary::Meta::TRACK => ::SkillfindTech::Api::Tracks::Announcement::Create::Summary::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::Index::Meta::TRACK => ::Api::Tracks::Page::Index::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::Edit::Meta::TRACK => ::Api::Tracks::Page::Edit::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Image::Edit::Meta::TRACK => ::Api::Tracks::Image::Edit::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Image::Index::Meta::TRACK => ::Api::Tracks::Image::Index::Meta::UNLOCALIZED_PATH,
          }
        end

        def append_track_data
          case track
          when ::SkillfindTech::Api::Tracks::Root::Meta::TRACK then ::SkillfindTech::Api::Tracks::Root::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Visitor::Contact::Meta::TRACK then ::SkillfindTech::Api::Tracks::Visitor::Contact::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Meta::TRACK then ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK then ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK then ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK then ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::User::New::Form::Meta::TRACK then ::SkillfindTech::Api::Tracks::User::New::Form::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Announcement::Create::Form::Meta::TRACK then ::SkillfindTech::Api::Tracks::Announcement::Create::Form::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Announcement::Create::Summary::Meta::TRACK then ::SkillfindTech::Api::Tracks::Announcement::Create::Summary::Appender.new(attrs).call
          when ::Api::Tracks::Page::Index::Meta::TRACK then ::Api::Tracks::Page::Index::Appender.new(attrs).call
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
            ::SkillfindTech::Api::Tracks::Root::Meta::TRACK => ::SkillfindTech::Api::Tracks::Root::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::Visitor::Contact::Meta::TRACK => ::SkillfindTech::Api::Tracks::Visitor::Contact::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Meta::TRACK => ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK => ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK => ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK => ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::Announcement::Create::Form::Meta::TRACK => ::SkillfindTech::Api::Tracks::Announcement::Create::Form::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::Announcement::Create::Summary::Meta::TRACK => ::SkillfindTech::Api::Tracks::Announcement::Create::Summary::Linker.new(lang).call,
            ::Api::Tracks::Page::Index::Meta::TRACK => ::Api::Tracks::Page::Index::Linker.new(lang).call,
            ::Api::Tracks::Image::Edit::Meta::TRACK => ::Api::Tracks::Image::Edit::Linker.new(lang).call,
            ::Api::Tracks::Image::Index::Meta::TRACK => ::Api::Tracks::Image::Index::Linker.new(lang).call,
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
