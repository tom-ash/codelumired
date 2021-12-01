# frozen_string_literal: true

module Codelumi
  module Api
    module Tracks
      module Helpers
        module Linker
          def initialize(lang)
            @lang = lang.to_sym
          end

          def call
            {
              url: url,
              title: title
            }
          end

          private

          attr_reader :lang

          def url
            unlocalized_path[lang]
          end

          def title
            unlocalized_title[lang]
          end
        end
      end
    end
  end
end
