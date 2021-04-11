# frozen_string_literal: true

module Warsawlease
  module Queries
    module Announcement
      class ById
        def initialize(id:, only_visible: false)
          @id = id
          @only_visible = only_visible
        end

        def call
          ::Warsawlease::Announcement.find(id)
        end

        private

        attr_reader :id, :only_visible

        def announcements
          return ::Warsawlease::Announcement.where(visible: true) if only_visible

          ::Warsawlease::Announcement.all
        end
      end
    end
  end
end
