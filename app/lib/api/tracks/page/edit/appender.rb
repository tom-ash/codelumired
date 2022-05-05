# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Edit
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Api::Tracks::Page::Edit::Meta

          private

          def authorize!
            raise UnauthorizedError unless current_user&.role == 'admin'
          end

          def merge_state
            serialized_page = camelize(::Serializers::Page::Show.new(page: page, constantized_site_name: constantized_site_name).call)
            state.merge!(
              'page/edit/inputs': serialized_page.merge(
                body: JSON.pretty_generate(serialized_page['body']),
                meta: JSON.pretty_generate(serialized_page['meta']),
                auto_schema: JSON.pretty_generate(serialized_page['autoSchema']),
                manual_schema: JSON.pretty_generate(serialized_page['manualSchema']),
                link_data: JSON.pretty_generate(serialized_page['linkData'])
              ),
              links: { 'langs': page.lang_edit_links }
            )
          end

          def page
            page_url = url.match(%r{^(pages|strony)/(.+)$})[2]
            site::Page.find_by(url: page_url)
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
