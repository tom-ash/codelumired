# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Index
        module Manage
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::Api::Tracks::Page::Index::Manage::Meta

            private

            def merge_state
              state.merge!(
                'page/index': {
                  page_keys: page_keys,
                  page_key: ''
                }
              )
            end

            def page_keys
              @page_keys ||= site::Page.order(url: :asc).pluck(:url)
            end
          end
        end
      end
    end
  end
end
