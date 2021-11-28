# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Show
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Api::Tracks::Page::Show::Meta

          class PageNotFoundError < StandardError; end

          def call
            # return error!('Page Not Found!.', 404) if page.blank?
            merge_state
            merge_meta
          end

          private

          def page
            @page ||= site::Page.find_by!(url: url)
          end

          def merge_state
            state.merge!(
              'app': { lang: page.lang },
              'page/show/data': ::Serializers::Page::Show.new(page: page, site_name: site_name).call
            )
          end

          def merge_meta
            meta.merge!(
              lang: page.lang,
              title: page.title,
              description: page.description,
              keywords: page.keywords,
              image: page.picture
            )
          end
        end
      end
    end
  end
end
