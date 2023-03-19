# frozen_string_literal: true

module Api
  module Image
    class Update < Grape::API
      # TODO: before { authorize_for_page! }

      params do
        requires :image_id, type: Integer
        requires :body, type: String
        optional :page_id, type: Integer
        optional :name, type: String
        optional :width, type: Integer
        optional :height, type: Integer
        optional :storage_key, type: String
        optional :storage_url, type: String
      end
      put do
        image_id = params[:image_id]
        body = JSON.parse(params[:body])
        width = params[:width]
        height = params[:height]
        storage_key = params[:storage_key]
        storage_url = params[:storage_url]

        image = site::Image.find(image_id)

        # byebug

        image.update(
          body: body,
          width: width,
          height: height,
          storage_key: storage_key,
          storage_url: storage_url,
        )
      end
    end
  end
end
