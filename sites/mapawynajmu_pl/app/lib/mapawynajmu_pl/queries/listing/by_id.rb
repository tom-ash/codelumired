# frozen_string_literal: true

module MapawynajmuPl
  module Queries
    module Listing
      class ById
        def initialize(id:, only_visible: false)
          @id = id
          @only_visible = only_visible
        end

        def call
          ::MapawynajmuPl::Listing
            .where(deleted_at: nil)
            .find(id)
        end

        private

        attr_reader :id, :only_visible

        def announcements
          return ::MapawynajmuPl::Listing.where(visible: true) if only_visible

          ::MapawynajmuPl::Listing.all
        end
      end
    end
  end
end
