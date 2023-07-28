# frozen_string_literal: true

module MapawynajmuPl
  module Queries
    module Listing
      module Index
        class User
          def initialize(user_id:, search_params: {})
            @user_id = user_id
            @search_params = search_params
          end

          def call
            user.announcements.where(
              deleted_at: nil,
            )
          end

          private

          attr_reader :user_id, :search_params

          def user
            @user ||= ::MapawynajmuPl::User.find(user_id)
          end
        end
      end
    end
  end
end
