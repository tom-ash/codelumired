# frozen_string_literal: true

module MapawynajmuPl
  module Serializers
    module Announcement
      class ShowMeta
        def initialize(announcement:, lang:)
          @announcement = announcement
          @lang = lang
        end

        def call
          { title: title, description: description, keywords: keywords, image: image }
        end

        private

        attr_reader :announcement, :lang

        def title
          { category: announcement.category, district: announcement.district, area: announcement.area }
        end

        def description
          { pl: announcement.polish_description, en: announcement.english_description }[:"#{lang}"]
        end

        def keywords
          { category: announcement.category, district: announcement.district }
        end

        def image
          { imageKey: "announcements/#{announcement.id}/#{announcement.pictures[0]['database']}" }
        end
      end
    end
  end
end
