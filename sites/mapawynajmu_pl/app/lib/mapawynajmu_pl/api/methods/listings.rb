# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Methods
      class Listings < Grape::API
        params do
          requires :listing_id, type: Integer
        end
        post 'promote' do
          listing_id = params[:listing_id]

          # TODO!: Move to Notify!
          listing = ::MapawynajmuPl::Listing.find(listing_id)
          listing.update!(is_promoted: true)

          return MapawynajmuPl::Commands::Order::Create.new(
            listing_id: listing_id,
            name: 'listing_promotion',
            price: 1900,
            currency: 'PLN',
            lang: lang,
            customer_ip: request.ip,
          ).call
        end
      end
    end
  end
end
