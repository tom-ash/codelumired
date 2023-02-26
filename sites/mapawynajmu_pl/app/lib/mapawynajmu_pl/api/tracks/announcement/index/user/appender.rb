# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Index
          module User
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::MapawynajmuPl::Api::Tracks::Announcement::Index::User::Meta

              private

              def data
                {
                  announcements: serialized_announcements,
                  amount: serialized_announcements.count,
                }
              end

              def announcements
                ::MapawynajmuPl::Queries::Announcement::Index::User.new(user_id: authenticated_user.id).call
              end

              def serialized_announcements
                ::MapawynajmuPl::Serializers::Announcement::Index::User.new(announcements, lang).call
              end
            end
          end
        end
      end
    end
  end
end
