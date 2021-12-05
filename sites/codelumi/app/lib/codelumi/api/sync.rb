# frozen_string_literal: true

module Codelumi
  module Api
    class Sync < ::Api::Sync
      helpers do
        def track_paths
          {

            ::Codelumi::Api::Tracks::Root::Meta::TRACK => ::Codelumi::Api::Tracks::Root::Meta::UNLOCALIZED_PATH,
            ::Codelumi::Api::Tracks::Visitor::Contact::Meta::TRACK => ::Codelumi::Api::Tracks::Visitor::Contact::Meta::UNLOCALIZED_PATH,
            ::Codelumi::Api::Tracks::Visitor::TermsOfService::Meta::TRACK => ::Codelumi::Api::Tracks::Visitor::TermsOfService::Meta::UNLOCALIZED_PATH,
            ::Codelumi::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK => ::Codelumi::Api::Tracks::Visitor::PrivacyPolicy::Meta::UNLOCALIZED_PATH,
            ::Codelumi::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK => ::Codelumi::Api::Tracks::Visitor::CookiesPolicy::Meta::UNLOCALIZED_PATH,
            ::Codelumi::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK => ::Codelumi::Api::Tracks::Visitor::PrivacySettings::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::New::Meta::TRACK => ::Api::Tracks::Page::New::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::Index::Manage::Meta::TRACK => ::Api::Tracks::Page::Index::Manage::Meta::UNLOCALIZED_PATH,
            ::Api::Tracks::Page::Edit::Meta::TRACK => ::Api::Tracks::Page::Edit::Meta::UNLOCALIZED_PATH
          }
        end

        def append_track_data
          case track
          when ::Codelumi::Api::Tracks::Root::Meta::TRACK then ::Codelumi::Api::Tracks::Root::Appender.new(attrs).call
          when ::Codelumi::Api::Tracks::Visitor::Contact::Meta::TRACK then ::Codelumi::Api::Tracks::Visitor::Contact::Appender.new(attrs).call
          when ::Codelumi::Api::Tracks::Visitor::TermsOfService::Meta::TRACK then ::Codelumi::Api::Tracks::Visitor::TermsOfService::Appender.new(attrs).call
          when ::Codelumi::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK then ::Codelumi::Api::Tracks::Visitor::PrivacyPolicy::Appender.new(attrs).call
          when ::Codelumi::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK then ::Codelumi::Api::Tracks::Visitor::CookiesPolicy::Appender.new(attrs).call
          when ::Codelumi::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK then ::Codelumi::Api::Tracks::Visitor::PrivacySettings::Appender.new(attrs).call
          when ::Api::Tracks::Page::New::Meta::TRACK then ::Api::Tracks::Page::New::Appender.new(attrs).call
          when ::Api::Tracks::Page::Index::Manage::Meta::TRACK then ::Api::Tracks::Page::Index::Manage::Appender.new(attrs).call
          when ::Api::Tracks::Page::Show::Meta::TRACK then ::Api::Tracks::Page::Show::Appender.new(**attrs, page: page).call
          when ::Api::Tracks::Page::Edit::Meta::TRACK then ::Api::Tracks::Page::Edit::Appender.new(attrs).call
          when ::Api::Tracks::Page::NotFound::Meta::TRACK then ::Api::Tracks::Page::NotFound::Appender.new(attrs).call
          end
        end

        def append_links
          links = state[:links] || {}
          state[:links] = links.merge(
            ::Codelumi::Api::Tracks::Root::Meta::TRACK => ::Codelumi::Api::Tracks::Root::Linker.new(lang).call,
            ::Codelumi::Api::Tracks::Visitor::Contact::Meta::TRACK => ::Codelumi::Api::Tracks::Visitor::Contact::Linker.new(lang).call,
            ::Codelumi::Api::Tracks::Visitor::TermsOfService::Meta::TRACK => ::Codelumi::Api::Tracks::Visitor::TermsOfService::Linker.new(lang).call,
            ::Codelumi::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK => ::Codelumi::Api::Tracks::Visitor::PrivacyPolicy::Linker.new(lang).call,
            ::Codelumi::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK => ::Codelumi::Api::Tracks::Visitor::CookiesPolicy::Linker.new(lang).call,
            ::Codelumi::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK => ::Codelumi::Api::Tracks::Visitor::PrivacySettings::Linker.new(lang).call,
            ::Api::Tracks::Page::New::Meta::TRACK => ::Api::Tracks::Page::New::Linker.new(:pl).call,
            ::Api::Tracks::Page::Index::Manage::Meta::TRACK => ::Api::Tracks::Page::Index::Manage::Linker.new(:pl).call
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
