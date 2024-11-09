# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Listing
      module Helpers
        module Attrs
          extend Grape::API::Helpers

          params :announcement_attrs do
            requires :announcement, type: Hash do
              requires :category, type: Integer
              requires :latitude, type: Float
              requires :longitude, type: Float
              requires :pictures, type: Array
              requires :social_image, type: String
              optional :locality, type: String
              optional :sublocality, type: String
              optional :route, type: String
              optional :area, type: Float
              optional :rent_currency, type: Integer
              optional :net_rent_amount, type: Float
              optional :gross_rent_amount, type: Float
              optional :rooms, type: Integer
              optional :floor, type: Integer
              optional :total_floors, type: Integer
              optional :availability_date, type: String
              optional :features, type: Array
              optional :furnishings, type: Array
              optional :polish_description, type: String
              optional :english_description, type: String
              optional :add_promotion, type: Boolean
            end
          end
        end
      end
    end
  end
end
