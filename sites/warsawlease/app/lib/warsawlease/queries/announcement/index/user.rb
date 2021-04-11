# frozen_string_literal: true

module Warsawlease
  module Queries
    module Announcement
      module Index
        class User
          def initialize(user_id:, search_params: {})
            @user_id = user_id
            @search_params = search_params
          end

          def call
            user.announcements
          end

          private

          attr_reader :user_id, :search_params

          def user
            @user ||= ::Warsawlease::User.find(user_id)
          end
        end
      end
    end
  end
end
