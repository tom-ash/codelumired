# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Listing
      module Update
        class Form < Grape::API
          helpers MapawynajmuPl::Api::Listing::Helpers::Attrs

          before { authorize_for_announcement! }

          params do
            requires :id, type: Integer
            use :announcement_attrs
          end
          put do
            add_promotion = params[:announcement][:add_promotion]
            listing_id = current_announcement.id

            ::MapawynajmuPl::Commands::Listing::Update.new(
              id: listing_id,
              attrs: params[:announcement],
            ).call

            if add_promotion
              current_announcement.update!(is_promoted: true)

              return MapawynajmuPl::Commands::Order::Create.new(
                listing_id: listing_id,
                name: 'listing_promotion',
                price: 1900,
                currency: 'PLN',
                lang: lang,
                customer_ip: request.ip,
              ).call
            end

            # TODO: Adjust the client's changeUrl to allow for '/'less urls.
            '/' + current_announcement.url(lang.to_sym)
          end
        end
      end
    end
  end
end
