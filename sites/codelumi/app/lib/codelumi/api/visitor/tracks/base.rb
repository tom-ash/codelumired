# frozen_string_literal: true

module Codelumi
  module Api
    module Visitor
      module Tracks
        class Base
          def initialize(attrs)
            @attrs = attrs
          end

          private

          attr_reader :attrs

          def lang
            @lang ||= attrs[:lang].to_sym
          end

          def state
            @state ||= attrs[:state]
          end

          def meta
            @meta ||= attrs[:meta]
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
