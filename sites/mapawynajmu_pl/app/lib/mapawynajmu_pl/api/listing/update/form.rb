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
              attrs: params[:announcement].merge(
                is_promoted: add_promotion
              )
            ).call

            if add_promotion
              return MapawynajmuPl::Commands::Order::Create.new(
                listing_id: listing_id,
                name: 'listing_promotion',
                price: 1900,
                currency: 'PLN',
                lang: lang,
                customer_ip: request.ip,
              ).call
            end

            current_announcement.url(lang.to_sym)
          end
        end
      end
    end
  end
end
