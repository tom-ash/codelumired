# frozen_string_literal: true

module Builders
  class SchemaOrg
    CONTEXT = 'https://schema.org'
    DEFAULT_TYPE = 'WebSite'

    def initialize(attrs)
      @attrs = attrs
    end

    def call
      JSON.pretty_generate({
        '@context': CONTEXT,
        '@type': attrs[:type] || DEFAULT_TYPE,
        isFamilyFriendly: true,
        inLanguage: attrs[:lang],
        name: attrs[:title],
        description: attrs[:description],
        keywords: attrs[:keywords],
        datePublished: attrs[:published_on],
        dateModified: attrs[:modified_on],
        url: attrs[:url],
        image: attrs[:picture]
      }.compact)
    end

    private

    attr_reader :attrs
  end
end
