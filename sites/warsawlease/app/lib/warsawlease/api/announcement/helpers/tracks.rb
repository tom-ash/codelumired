# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Helpers
        module Tracks
          extend Grape::API::Helpers

          private

          def handle_announcement_tracks
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
            when ::Api::Tracks::Page::Show::Meta::TRACK then ::Api::Tracks::Page::Show::Appender.new(attrs).call
            when ::Api::Tracks::Page::Edit::Meta::TRACK then ::Api::Tracks::Page::Edit::Appender.new(attrs).call
            end
          end
        end
      end
    end
  end
end
