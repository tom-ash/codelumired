# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Create
          module Summary
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::Warsawlease::Api::Tracks::Announcement::Create::Summary::Meta

              def initialize(attrs)
                @current_announcement = attrs[:current_announcement]
                super
              end

              def call
                merge_state
                super
              end

              private

              attr_reader :current_announcement

              def merge_state
                state.merge!(
                  'announcement/create/data': {
                    announcement: ::Warsawlease::Serializers::Announcement::Show.new(current_announcement).call.merge(
                      path: current_announcement.url(lang),
                      title: current_announcement.title(lang)
                    )
                  },
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
