# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module User
        module ResetPassword
          class Linker
            include ::Api::Tracks::Helpers::Linker
            include ::Warsawlease::Api::Tracks::User::ResetPassword::Meta
          end
        end
      end
    end
  end
end
