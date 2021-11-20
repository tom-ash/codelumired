# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module User
        module Create
          module Form
            class Linker
              include ::Warsawlease::Api::Tracks::Helpers::Linker
              include ::Warsawlease::Api::Tracks::User::Create::Form::Meta
            end
          end
        end
      end
    end
  end
end
