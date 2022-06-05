# frozen_string_literal: true

module SoundofIt
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

          def merge_meta; end

          def lang
            @lang ||= attrs[:lang].to_sym
          end

          def state
            @state ||= attrs[:state]
          end

          def meta
            @meta ||= begin
              attrs_meta = attrs[:meta]
              attrs_meta.merge!(
                title: title,
                description: description,
                keywords: keywords,
                image: image,
                schema: schema
              )
              attrs_meta
            end
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
end
