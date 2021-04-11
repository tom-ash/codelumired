# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      class GetTile < Grape::API
        params { requires :id, type: Integer }
        get do
          announcement = ::Warsawlease::Queries::Announcement::ById.new(id: params[:id]).call
          ::Warsawlease::Serializers::Announcement::Tile.new(announcement).call
        end
      end
    end
  end
end
