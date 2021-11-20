# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module User
        module Create
          module Verification
            class Linker
              include ::Api::Tracks::Helpers::Linker
              include ::Warsawlease::Api::Tracks::User::Create::Verification::Meta
            end
          end
        end
      end
    end
  end
end
