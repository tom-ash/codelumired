# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Index
          module User
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::Warsawlease::Api::Tracks::Announcement::Index::User::Meta

              def call
                merge_state
                super
              end

              private

              def merge_state
                state.merge!(
                  'announcement/index/data': {
                    announcements: serialized_announcements,
                    amount: serialized_announcements.count
                  }
                )
              end

              def announcements
                ::Warsawlease::Queries::Announcement::Index::User.new(user_id: current_user.id).call
              end

              def serialized_announcements
                ::Warsawlease::Serializers::Announcement::Index::User.new(announcements).call
              end
            end
          end
        end
      end
    end
  end
end
