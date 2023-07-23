# frozen_string_literal: true

module Api
  module Tracks
    module Image
      module Edit
        class Appender < ::Api::Tracks::Common::Appender
          private

          def authorize!
            raise ::Api::UnauthorizedError unless authenticated_user&.role == 'admin'
          end

          def data
            {
              apiUrl: api_url,
              id: image.id,
              body: image.body,
              storageUrl: image.storage_url,
            }
          end

          def image
            @image ||= site::Image.find_by(storage_key: storage_key)
          end

          def storage_key
            @storage_key ||= url.match(%r{(images|obrazy)\/(.+)})[2]
          end

          def texts
            {
              pl: {
                storageKeyInputLabel: 'Klucz magazynu',
                storageUrlLinkLabel: 'URL magazynu',
                widthInputLabel: 'Szerokość',
                heightInputLabel: 'Wysokość',
              },
              en: {
                storageKeyInputLabel: 'Storage Key',
                storageUrlLinkLabel: 'Storage URL',
                widthInputLabel: 'Width',
                heightInputLabel: 'Height',
              },
            }[lang]
          end

          def inputs
            {
              storageKey: image.storage_key,
              width: image.width,
              height: image.height,
              body: JSON.pretty_generate(image.body),
            }
          end
        end
      end
    end
  end
end
