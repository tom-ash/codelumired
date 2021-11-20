# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Helpers
        module Linker
          include ::Api::Tracks::Helpers::Linker
          include ::Warsawlease::Api::Tracks::Helpers::RootDomain
        end
      end
    end
  end
end
