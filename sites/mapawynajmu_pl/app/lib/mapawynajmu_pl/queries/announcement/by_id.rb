# frozen_string_literal: true

module MapawynajmuPl
  module Queries
    module Announcement
      class ById
        def initialize(id:, only_visible: false)
          @id = id
          @only_visible = only_visible
        end

        def call
          ::MapawynajmuPl::Announcement.find(id)
        end

        private

        attr_reader :id, :only_visible

        def announcements
          return ::MapawynajmuPl::Announcement.where(visible: true) if only_visible

          ::MapawynajmuPl::Announcement.all
        end
      end
    end
  end
end
