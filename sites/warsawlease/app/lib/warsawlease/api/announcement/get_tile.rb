# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Announcement
      class GetTile < Grape::API
        params { requires :id, type: Integer }

        get do
          announcement = ::MapawynajmuPl::Queries::Announcement::ById.new(id: params[:id]).call
          camelize(::MapawynajmuPl::Serializers::Announcement::Tile.new(announcement: announcement, lang: lang).call)
        end
      end
    end
  end
end
