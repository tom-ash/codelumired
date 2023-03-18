# frozen_string_literal: true

module Api
  module Tracks
    module Image
      module Index
        class Appender < ::Api::Tracks::Common::Appender
          private

          def data
            {
              recordKeys: recordKeys,
              recordKey: '',
              recordPath: recordPath,
              apiUrl: api_url,
            }
          end

          def texts
            {
              pl: {
                createRecordButtonLabel: 'Dodaj obraz',
              },
              en: {
                createRecordButtonLabel: 'Add Image',
              },
            }[lang]
          end

          def recordKeys
            @recordKeys ||= site::Image.order(storage_key: :asc).pluck(:storage_key)
          end

          def recordPath
            {
              pl: 'obrazy',
              en: 'images',
            }[lang]
          end
        end
      end
    end
  end
end
