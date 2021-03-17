# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      class GetPhoneNumber < Grape::API
        params do
          requires :id, type: Integer
        end
        get do
          announcement = ::Warsawlease::Announcement.find(params[:id])
          country_code, phone_number = announcement.user.slice(:country_code, :phone_number).values
          "#{country_code} #{phone_number}"
        end
      end
    end
  end
end
