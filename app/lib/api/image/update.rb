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
        optional :name, type: String
        optional :width, type: Integer
        optional :height, type: Integer
      end
      put do
        # byebug
        image_id = params[:image_id]
        body = params[:body]
        width = params[:width]
        height = params[:height]

        image = site::Image.find(image_id)

        body.map do |body_el|
          next if body_el.class == String

          body_el.deep_transform_keys do |key|
            key.to_s.camelize(:lower)
          end
        end

        image.update(body: body, width: width, height: height)
      end
    end
  end
end
