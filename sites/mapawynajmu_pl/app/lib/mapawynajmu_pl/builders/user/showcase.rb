# frozen_string_literal: true

module MapawynajmuPl
  module Builders
    module User
      class Showcase
        def initialize(user)
          @user = user
        end

        def call
          user.assign_attributes(
            showcase: {
              name: user.first_name || user.business_name,
              phone: "#{user.country_code} #{user.phone_number[0, 3]}"
            }
          )
        end

        private

        attr_reader :user
      end
    end
  end
end
