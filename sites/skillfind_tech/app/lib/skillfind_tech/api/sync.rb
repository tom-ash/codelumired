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

            ::SkillfindTech::Api::Tracks::User::New::Verify::Meta::TRACK => ::SkillfindTech::Api::Tracks::User::New::Verify::Meta::UNLOCALIZED_PATH,

            ::SkillfindTech::Api::Tracks::User::Auth::Meta::TRACK => ::SkillfindTech::Api::Tracks::User::Auth::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::User::ResetPassword::Meta::TRACK => ::SkillfindTech::Api::Tracks::User::ResetPassword::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Posting::Create::Form::Meta::TRACK => ::SkillfindTech::Api::Tracks::Posting::Create::Form::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Posting::Create::Summary::Meta::TRACK => ::SkillfindTech::Api::Tracks::Posting::Create::Summary::Meta::UNLOCALIZED_PATH,

            ::SkillfindTech::Api::Tracks::Posting::Show::Meta::TRACK => ::SkillfindTech::Api::Tracks::Posting::Show::Meta::UNLOCALIZED_PATH,

            ::SkillfindTech::Api::Tracks::Page::Index::Meta::TRACK => ::SkillfindTech::Api::Tracks::Page::Index::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Page::Edit::Meta::TRACK => ::SkillfindTech::Api::Tracks::Page::Edit::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Image::Index::Meta::TRACK => ::SkillfindTech::Api::Tracks::Image::Index::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Image::Edit::Meta::TRACK => ::SkillfindTech::Api::Tracks::Image::Edit::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Assets::Index::Meta::TRACK => ::SkillfindTech::Api::Tracks::Assets::Index::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Redirects::Index::Meta::TRACK => ::SkillfindTech::Api::Tracks::Redirects::Index::Meta::UNLOCALIZED_PATH,
            ::SkillfindTech::Api::Tracks::Questions::Show::Meta::TRACK => ::SkillfindTech::Api::Tracks::Questions::Show::Meta::UNLOCALIZED_PATH
          }
        end

        def append_track_data
          raise ::Api::TrackNotFoundError if track == 'page/not-found'

          case track
          when ::SkillfindTech::Api::Tracks::Root::Meta::TRACK then ::SkillfindTech::Api::Tracks::Root::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Visitor::Contact::Meta::TRACK then ::SkillfindTech::Api::Tracks::Visitor::Contact::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Meta::TRACK then ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK then ::SkillfindTech::Api::Tracks::Visitor::PrivacyPolicy::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK then ::SkillfindTech::Api::Tracks::Visitor::CookiesPolicy::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK then ::SkillfindTech::Api::Tracks::Visitor::PrivacySettings::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::User::New::Form::Meta::TRACK then ::SkillfindTech::Api::Tracks::User::New::Form::Appender.new(attrs).call

          when ::SkillfindTech::Api::Tracks::User::New::Verify::Meta::TRACK then ::SkillfindTech::Api::Tracks::User::New::Verify::Appender.new(attrs).call

          when ::SkillfindTech::Api::Tracks::User::Auth::Meta::TRACK then ::SkillfindTech::Api::Tracks::User::Auth::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::User::ResetPassword::Meta::TRACK then ::SkillfindTech::Api::Tracks::User::ResetPassword::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Posting::Create::Form::Meta::TRACK then ::SkillfindTech::Api::Tracks::Posting::Create::Form::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Posting::Create::Summary::Meta::TRACK then ::SkillfindTech::Api::Tracks::Posting::Create::Summary::Appender.new(attrs).call

          when ::SkillfindTech::Api::Tracks::Posting::Show::Meta::TRACK then ::SkillfindTech::Api::Tracks::Posting::Show::Appender.new(attrs).call

          when ::SkillfindTech::Api::Tracks::Page::Index::Meta::TRACK then ::SkillfindTech::Api::Tracks::Page::Index::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Page::Show::Meta::TRACK then ::SkillfindTech::Api::Tracks::Page::Show::Appender.new(**attrs, page: page).call
          when ::SkillfindTech::Api::Tracks::Page::Edit::Meta::TRACK then ::SkillfindTech::Api::Tracks::Page::Edit::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Image::Index::Meta::TRACK then ::SkillfindTech::Api::Tracks::Image::Index::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Image::Edit::Meta::TRACK then ::SkillfindTech::Api::Tracks::Image::Edit::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Assets::Index::Meta::TRACK then ::SkillfindTech::Api::Tracks::Assets::Index::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Redirects::Index::Meta::TRACK then ::SkillfindTech::Api::Tracks::Redirects::Index::Appender.new(attrs).call
          when ::Api::Tracks::Redirect::Show::Meta::TRACK then ::Api::Tracks::Redirect::Show::Appender.new(attrs).call
          when ::SkillfindTech::Api::Tracks::Questions::Show::Meta::TRACK then ::SkillfindTech::Api::Tracks::Questions::Show::Appender.new(attrs).call
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
            ::SkillfindTech::Api::Tracks::User::ResetPassword::Meta::TRACK => ::SkillfindTech::Api::Tracks::User::ResetPassword::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::User::New::Form::Meta::TRACK => ::SkillfindTech::Api::Tracks::User::New::Form::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::User::Auth::Meta::TRACK => ::SkillfindTech::Api::Tracks::User::Auth::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::Posting::Create::Form::Meta::TRACK => ::SkillfindTech::Api::Tracks::Posting::Create::Form::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::Posting::Create::Summary::Meta::TRACK => ::SkillfindTech::Api::Tracks::Posting::Create::Summary::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::Page::Index::Meta::TRACK => ::SkillfindTech::Api::Tracks::Page::Index::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::Image::Index::Meta::TRACK => ::SkillfindTech::Api::Tracks::Image::Index::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::SocialPages::Facebook::Meta::TRACK => ::SkillfindTech::Api::Tracks::SocialPages::Facebook::Linker.new(lang).call,
            ::SkillfindTech::Api::Tracks::SocialPages::Linkedin::Meta::TRACK => ::SkillfindTech::Api::Tracks::SocialPages::Linkedin::Linker.new(lang).call,
          )
        end

        def append_track_not_found_data
          ::SkillfindTech::Api::Tracks::Page::NotFound::Appender.new(attrs).call
        end
      end
    end
  end
end
