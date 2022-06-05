# frozen_string_literal: true

module Builders
  class OpenGraph
    TYPE = 'website'
    DEFAULT_IMAGE_WIDTH = 1200
    DEFAULT_IMAGE_HEIGHT = 630

    def initialize(attrs)
      @attrs = attrs
    end

    def call
      open_graph = ''

      elements.each do |k, v|
        open_graph += "<meta property=\"og:#{k}\" content=\"#{v}\"/>"
      end

      locale_alts = attrs[:locale_alts]
      if locale_alts.present?
        locale_alts.each do |locale_alt|
          open_graph += "<meta property=\"og:locale:alternate\" content=\"#{open_graph_locale(locale_alt)}\"/>"
        end
      end

      open_graph
    end

    private

    attr_reader :attrs

    def elements
      {
        site_name: attrs[:site_name],
        url: attrs[:url],
        type: TYPE,
        title: attrs[:title],
        description: attrs[:description],
        keywords: attrs[:keywords],
        image: attrs[:image],
        'image:width': DEFAULT_IMAGE_WIDTH,
        'image:height': DEFAULT_IMAGE_HEIGHT,
        locale: open_graph_locale(attrs[:locale])
      }
    end

    def open_graph_locale(lang)
      locales = {
        pl: 'pl_PL',
        en: 'en_GB'
      }

      locales[lang]
    end
  end
end
