# frozen_string_literal: true

module Api
  module Tracks
    module Page
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
                createRecordButtonLabel: 'Dodaj stronę',
              },
              en: {
                createRecordButtonLabel: 'Add Page',
              },
            }[lang]
          end

          def recordKeys
            @recordKeys ||= site::Page.order(url: :asc).pluck(:url)
          end

          def recordPath
            {
              pl: 'strony',
              en: 'pages',
            }[lang]
          end
        end
      end
    end
  end
end
