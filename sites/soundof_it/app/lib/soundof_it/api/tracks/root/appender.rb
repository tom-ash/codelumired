# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Root
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::SoundofIt::Api::Tracks::Root::Meta

          private

          def merge_state
            state.merge!(
              'page/index': {
                tutorials: tutorials
              }
            )
          end

          def page_name
            @page_name ||= 'root'
          end

          def tutorials
            ::SoundofIt::Page.where(category: 'tutorials').pluck(:link_data)
          end
        end
      end
    end
  end
end
