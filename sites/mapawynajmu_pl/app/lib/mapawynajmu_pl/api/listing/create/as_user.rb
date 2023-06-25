# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Listing
      module Create
        class AsUser < Grape::API
          helpers MapawynajmuPl::Api::Listing::Helpers::Attrs

          before { authorize! }

          params { use :announcement_attrs }
          post do
            ::MapawynajmuPl::Commands::Listing::Create.new(
              user_id: authenticated_user.id,
              attrs: params[:announcement].merge(user_verified: true),
            ).call

            created_announcement = authenticated_user.announcements.last

            if (created_announcement.is_promoted?)
              return MapawynajmuPl::Commands::Order::Create.new(
                listing_id: created_announcement.id,
                name: 'listing_promotion',
                price: 2900,
                currency: 'PLN',
                lang: lang,
                customer_ip: request.ip,
              ).call
            end

            TransactionalMailer.listing_confirmation_email(
              to: created_announcement.user.email,
              listing_id: created_announcement.id,
              lang: lang,
            ).deliver_now

            created_announcement.summary_path(lang)
          end
        end
      end
    end
  end
end
