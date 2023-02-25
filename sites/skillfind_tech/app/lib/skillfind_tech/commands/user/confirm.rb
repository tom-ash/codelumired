# frozen_string_literal: true

module SkillfindTech
  module Commands
    module User
      class Confirm
        def initialize(user_id:)
          # TODO
        end

        def call
          # TODO
        end

        private

        attr_reader :user_id

        def user
          @user ||= ::SkillfindTech::User.find(user_id)
        end
      end
    end
  end
end
