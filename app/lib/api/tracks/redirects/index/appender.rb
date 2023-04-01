# frozen_string_literal: true

module Api
  module Tracks
    module Redirects
      module Index
        class Appender < ::Api::Tracks::Common::Appender
          include ::Api::Tracks::Redirects::Index::Meta

          private

          def data
            {
              redirects: site::Redirect.all.sort_by(&:original_url),
            }
          end

          def texts
            {
              pl: {
                addAssetButtonLabel: 'Dodaj przekierowanie',
              },
              en: {
                addAssetButtonLabel: 'Add Redirect',
              },
            }[lang]
          end
        end
      end
    end
  end
end
