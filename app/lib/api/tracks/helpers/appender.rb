# frozen_string_literal: true

module Api
  module Tracks
    module Helpers
      module Appender
        def initialize(attrs)
          @attrs = attrs
        end

        def call
          merge_meta
        end

        private

        attr_reader :attrs

        def merge_meta
          meta.merge!(
            title: title,
            keywords: keywords,
            description: description
          )
        end

        def lang
          @lang ||= attrs[:lang].to_sym
        end

        def state
          @state ||= attrs[:state]
        end

        def meta
          @meta ||= attrs[:meta]
        end

        def current_user
          @current_user ||= attrs[:current_user]
        end

        def url
          @url ||= attrs[:url]
        end

        def params
          @params ||= attrs[:params]
        end

        def title
          @title ||= unlocalized_title[lang]
        end

        def keywords
          @keywords ||= unlocalized_keywords[lang]
        end

        def description
          @description ||= unlocalized_description[lang]
        end
      end
    end
  end
end
