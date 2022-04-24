# frozen_string_literal: true

module Api
  module Image
    class Create < Grape::API
      # TODO: before { authorize_for_page! }

      params do
        requires :image_key, type: String
      end
      post do
        image_key = params[:image_key]
        raise 'Empty Image Key Error' unless image_key.present? && current_user.present?

        site::Image.create(
          added_by_id: current_user.id,
          storage_key: image_key,
          body: []
        )
      end
    end
  end
end
