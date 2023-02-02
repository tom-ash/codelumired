# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Confirmation
            class Linker
              include ::MapawynajmuPl::Api::Tracks::Helpers::Linker
              include ::MapawynajmuPl::Api::Tracks::User::Create::Confirmation::Meta
            end
          end
        end
      end
    end
  end
end
