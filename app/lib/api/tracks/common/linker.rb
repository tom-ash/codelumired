# frozen_string_literal: true

module Api
  module Tracks
    module Common
      class Linker
        def initialize(lang, decorators = nil)
          @lang = lang.to_sym
          @decorators = decorators
        end

        def call
          {
            href: href,
            path: path,
            title: title,
            label: label,
            href_lang: lang,
          }
        end

        private

        attr_reader :lang, :decorators

        def href
          "/#{unlocalized_path[lang]}"
        end

        def path
          unlocalized_path[lang]
        end

        def title
          unlocalized_title[lang]
        end

        def label
          nil
        end
      end
    end
  end
end
