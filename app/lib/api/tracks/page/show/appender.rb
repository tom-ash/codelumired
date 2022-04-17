# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Show
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Api::Tracks::Page::Show::Meta

          def initialize(attrs)
            @page = attrs[:page]
            super
          end

          private

          attr_reader :page

          def merge_state
            state.merge!(
              'page/show/data': data,
              links: links
            )
          end

          def data
            ::Serializers::Page::Show.new(page: page, constantized_site_name: constantized_site_name).call
          end

          def merge_meta
            meta.merge!(
              lang: page.lang,
              title: page.title,
              description: page.description,
              keywords: page.keywords,
              image: page.picture,
              schema: JSON.pretty_generate(page.schema_mode == 'auto' ? page.auto_schema : page.manual_schema)
            )
          end
        end
      end
    end
  end
end
