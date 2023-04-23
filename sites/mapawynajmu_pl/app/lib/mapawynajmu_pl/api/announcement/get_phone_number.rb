# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Listing
      class GetPhoneNumber < Grape::API
        params { requires :id, type: Integer }
        get do
          announcement = ::MapawynajmuPl::Listing.find(params[:id])
          country_code, phone_number = announcement.user.slice(:country_code, :phone_number).values
          "#{country_code} #{phone_number}"
        end
      end
    end
  end
end
