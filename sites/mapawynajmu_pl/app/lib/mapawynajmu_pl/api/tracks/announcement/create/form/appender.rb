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

              NO_ERROR = { pl: '', en: '' }.freeze

              private

              def control
                {
                  step: 'form',
                  shouldInitializeMap: false,
                  isMapInitialized: false,
                  addAvailabilityDate: false, # TODO: Move to data.
                  connecting: false,
                  publishing: false,
                  addingPicture: false,
                  savingAnnouncement: false,
                  success: false,
                }
              end

              def errors
                {
                  category: NO_ERROR,
                  map: NO_ERROR,
                  pictures: NO_ERROR,
                }
              end
            end
          end
        end
      end
    end
  end
end
