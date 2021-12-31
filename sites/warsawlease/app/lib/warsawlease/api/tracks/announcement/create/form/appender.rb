# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::MapawynajmuPl::Api::Tracks::Announcement::Create::Form::Meta

              private

              def page_name
                @page_name ||= 'create_announcement'
              end
            end
          end
        end
      end
    end
  end
end
