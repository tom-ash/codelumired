# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Form
            class Linker
              include ::MapawynajmuPl::Api::Tracks::Helpers::Linker
              include ::MapawynajmuPl::Api::Tracks::User::Create::Form::Meta
            end
          end
        end
      end
    end
  end
end
