# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module User
        module Edit
          class Linker
            include ::Warsawlease::Api::Tracks::Helpers::Linker
            include ::Warsawlease::Api::Tracks::User::Edit::Meta
          end
        end
      end
    end
  end
end
