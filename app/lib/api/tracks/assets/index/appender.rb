# frozen_string_literal: true

module Api
  module Tracks
    module Assets
      module Index
        class Appender < ::Api::Tracks::Common::Appender
          private

          def authorize!
            raise ::Api::UnauthorizedError unless authenticated_user&.role == 'admin'
          end

          def data
            {
              assets: ::MapawynajmuPl::Asset.all.sort_by(&:name), # Use site when possible.
            }
          end

          def texts
            {
              pl: {
                addAssetButtonLabel: 'Dodaj Asset',
              },
              en: {
                addAssetButtonLabel: 'Add Asset',
              },
            }[lang]
          end
        end
      end
    end
  end
end
