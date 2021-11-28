# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Edit
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Api::Tracks::Page::Edit::Meta

          private

          def merge_state
            serialized_page = ::Serializers::Page::Show.new(page: page, site_name: site_name).call
            state.merge!(
              'page/edit/inputs': serialized_page.merge(
                body: JSON.pretty_generate(serialized_page[:body]),
                meta: JSON.pretty_generate(camelize(serialized_page[:meta]))
              ),
              links: { 'langs': page.lang_edit_links }
            )
          end

          def merge_meta; end

          def page
            page_url = url.match(%r{^(edit-page|edytuj-strone)/(.+)$})[2]
            site::Page.find_by(url: page_url, lang: lang)
          end

          # TODO -> Move to service.
          def camelize(response)
            response.as_json.deep_transform_keys do |key|
              key.exclude?('/') ? key.to_s.camelize(:lower) : key
            end
          end
        end
      end
    end
  end
end
