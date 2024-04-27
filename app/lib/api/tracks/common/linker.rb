# frozen_string_literal: true

module Api
  module Tracks
    module Common
      class Linker
        def initialize(lang, decorators = {})
          @lang = lang.to_sym
          @decorators = decorators
        end

        def call
          {
            href: href,
            hrefLang: lang,
            title: title,
            label: label,
            icon: icon,
          }
        end

        def getForSitemap
          {
            href: href,
            hrefLang: lang,
            priority: priority,
            changeFreq: changeFreq,
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

        def priority
          @priority ||= metaClass::PRIORITY
        end

        def changeFreq
          @changeFreq ||= metaClass::CHANGE_FREQ
        end

        def metaClass
          @metaClass ||= self.class.to_s.gsub(/(::Linker$)/, '').constantize::Meta
        end

        def icon
          nil
        end
      end
    end
  end
end
