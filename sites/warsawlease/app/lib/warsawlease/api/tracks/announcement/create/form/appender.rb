# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::Warsawlease::Api::Tracks::Announcement::Create::Form::Meta

              private

              def merge_state
                state.merge!(
                  render: render,
                  links: links
                )
              end
            end
          end
        end
      end
    end
  end
end
