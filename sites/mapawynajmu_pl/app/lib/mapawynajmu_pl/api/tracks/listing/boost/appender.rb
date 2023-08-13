# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Boost
          class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
            include ::MapawynajmuPl::Api::Tracks::Listing::Boost::Meta
            include ::MapawynajmuPl::Api::Tracks::Listing::Boost::Assets

            private

            def data
              {
                order_href: order_href,
              }
            end

            def listing
              @listing ||= begin
                list = ::MapawynajmuPl::Listing.find(listing_id)
                list.update!(is_promoted: true)
                list
              end
            end

            def listing_id
              @listing_id ||= attrs[:url].match(%r{(podbij-ogloszenie|boost-listing)/(\d+)})[2]
            end

            def order_href
              @order_href ||= MapawynajmuPl::Commands::Order::Create.new(
                listing_id: listing.id,
                name: 'listing_promotion',
                price: 1900,
                currency: 'PLN',
                lang: lang,
                customer_ip: request_ip,
              ).call
            end
          end
        end
      end
    end
  end
end
