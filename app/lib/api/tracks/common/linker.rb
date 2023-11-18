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
            hrefLang: lang,
            title: title,
            label: label,
          }
        end

        private

        attr_reader :lang, :decorators

        def href
          localized_path = unlocalized_path[lang]

          localized_path == '/' ? '/' : "/#{localized_path}"
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
