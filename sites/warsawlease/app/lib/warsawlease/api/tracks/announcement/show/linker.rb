# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Show
          class Linker
            def initialize(announcement:, lang:)
              @announcement = announcement
              @lang = lang
            end

            def call
              announcement.url(lang)
            end

            private

            attr_reader :announcement, :lang
          end
        end
      end
    end
  end
end
