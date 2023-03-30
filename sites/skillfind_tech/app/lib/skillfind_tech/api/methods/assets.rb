# frozen_string_literal: true

module SkillfindTech
  module Api
    module Methods
      class Assets < Grape::API
        post do
          ::MapawynajmuPl::Asset.create(name: '_')
        end

        delete ':id' do
          asset = ::MapawynajmuPl::Asset.find(params[:id])
          asset.destroy!
        end

        params do
          requires :name, type: String
          requires :path_data, type: String
          requires :view_box, type: String
        end
        put ':id' do
          asset = ::MapawynajmuPl::Asset.find(params[:id])
          asset.update(
            name: params[:name],
            path_data: params[:path_data],
            view_box: params[:view_box],
          )
        end
      end
    end
  end
end
