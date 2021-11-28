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
            state.merge!(
              'page/edit': ::Serializers::Page::Show.new(page: page, site_name: site_name).call,
              links: { 'langs': page.lang_edit_links }
            )
          end

          def merge_meta; end

          def page
            page_url = url.match(%r{^(edit-page|edytuj-strone)/(.+)$})[2]
            site::Page.find_by(url: page_url, lang: lang)
          end
        end
      end
    end
  end
end
