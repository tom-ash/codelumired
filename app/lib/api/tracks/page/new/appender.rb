# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module New
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::Api::Tracks::Page::New::Meta

          private

          def merge_state
            state.merge!(
              'page/create/data': { names: site::Page.all.pluck(:name).uniq.sort }
            )
          end

          def merge_meta; end
        end
      end
    end
  end
end
