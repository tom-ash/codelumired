# frozen_string_literal: true

module Api
  module Image
    class Update < Grape::API
      # TODO: Secure endpoint.
      # before { authorize_for_page! }

      params do
        requires :image_id, type: Integer
        requires :body, type: Array
        optional :page_id, type: Integer
      end
      put do
        image_id = params[:image_id]
        body = params[:body]

        image = site::Image.find(image_id)

        camelizedBody = body.map do |body_el|
          body_el.deep_transform_keys do |key|
            key.to_s.camelize(:lower)
          end
        end

        image.update(body: camelizedBody)
      end
    end
  end
end
