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
            when Warsawlease::Api::Tracks::Root::Meta::TRACK
              ::Warsawlease::Api::Tracks::Root::Appender.new(attrs).call
            when ::Warsawlease::Api::Tracks::Announcement::Create::Form::Meta::TRACK
              ::Warsawlease::Api::Tracks::Announcement::Create::Form::Appender.new(attrs).call
            when Warsawlease::Api::Tracks::Visitor::Contact::Meta::TRACK
              ::Warsawlease::Api::Tracks::Visitor::Contact::Appender.new(attrs).call
            when Warsawlease::Api::Tracks::Visitor::TermsOfService::Meta::TRACK
              ::Warsawlease::Api::Tracks::Visitor::TermsOfService::Appender.new(attrs).call
            when Warsawlease::Api::Tracks::Visitor::PrivacyPolicy::Meta::TRACK
              ::Warsawlease::Api::Tracks::Visitor::PrivacyPolicy::Appender.new(attrs).call
            when Warsawlease::Api::Tracks::Visitor::CookiesPolicy::Meta::TRACK
              ::Warsawlease::Api::Tracks::Visitor::CookiesPolicy::Appender.new(attrs).call
            when Warsawlease::Api::Tracks::Visitor::PrivacySettings::Meta::TRACK
              ::Warsawlease::Api::Tracks::Visitor::PrivacySettings::Appender.new(attrs).call
            when Warsawlease::Api::Tracks::User::Create::Form::Meta::TRACK
              ::Warsawlease::Api::Tracks::User::Create::Form::Appender.new(attrs).call
            when ::Warsawlease::Api::Tracks::User::Create::Verification::Meta::TRACK
              ::Warsawlease::Api::Tracks::User::Create::Verification::Appender.new(attrs).call
            when ::Warsawlease::Api::Tracks::Announcement::Index::User::Meta::TRACK
              ::Warsawlease::Api::Tracks::Announcement::Index::User::Appender.new(attrs).call
            when ::Warsawlease::Api::Tracks::User::Edit::Meta::TRACK
              ::Warsawlease::Api::Tracks::User::Edit::Appender.new(attrs).call
            when ::Warsawlease::Api::Tracks::User::ResetPassword::Meta::TRACK
              ::Warsawlease::Api::Tracks::User::ResetPassword::Appender.new(attrs).call
            when ::Warsawlease::Api::Tracks::User::Authorize::Meta::TRACK
              ::Warsawlease::Api::Tracks::User::Authorize::Appender.new(attrs).call
            when ::Warsawlease::Api::Tracks::Announcement::Create::Summary::Meta::TRACK
              ::Warsawlease::Api::Tracks::Announcement::Create::Summary::Appender.new(**attrs, current_announcement: current_announcement).call
            when ::Warsawlease::Api::Tracks::Announcement::Show::Meta::TRACK
              ::Warsawlease::Api::Tracks::Announcement::Show::Appender.new(attrs).call
            when ::Warsawlease::Api::Tracks::Announcement::Edit::Meta::TRACK
              ::Warsawlease::Api::Tracks::Announcement::Edit::Appender.new(attrs).call
            end
          end
        end
      end
    end
  end
end
