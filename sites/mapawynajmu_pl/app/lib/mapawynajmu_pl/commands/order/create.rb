# frozen_string_literal: true

module MapawynajmuPl
  module Commands
    module Order
      class Create
        include ::MapawynajmuPl::ProtocolAndDomain

        def initialize(attrs)
          @listing_id = attrs[:listing_id]
          @name = attrs[:name]
          @price = attrs[:price]
          @currency = attrs[:currency]
          @lang = attrs[:lang]
          @customer_ip = attrs[:customer_ip]
        end

        def call
          res = create_order_at_payu
          @orderId = res['orderId']
          create_order_in_database
          res['redirectUri']
        end

        attr_reader :listing_id, :name, :payu_merchant_pos_id, :price, :currency, :lang, :customer_ip

        private

        def create_order_at_payu
          uri = URI(ENV['PAYU_ORDERS_URL'])
          payu_bearer_token = ::MapawynajmuPl::Queries::PayuBearerToken.new.call['access_token']

          req_body = {
            notifyUrl: 'https://764f-2a02-a311-4043-2300-753c-1bb1-903b-6ca8.eu.ngrok.io/mapawynajmu-pl/orders/notify',
            continueUrl: "#{protocol_and_domain}/#{listing.summary_path(lang)}",
            customerIp: customer_ip,
            merchantPosId: ENV['PAYU_MERCHANT_POST_ID'],
            description: name,
            currencyCode: currency,
            totalAmount: price,
            buyer: {
              language: lang,
            },
            products: [
              {
                'name': name,
                'unitPrice': price,
                'quantity': 1,
              },
            ]
          }

          res = Net::HTTP.post uri,
                req_body.to_json,
                'Authorization' => "Bearer #{payu_bearer_token}",
                'Content-Type' => 'application/json'

          JSON.parse(res.body)
        end

        def create_order_in_database
          ::MapawynajmuPl::Order.create!(
            announcement_id: listing_id,
            payu_order_id: @orderId,
            status: 'PENDING',
            payu_merchant_pos_id: ENV['PAYU_MERCHANT_POST_ID'],
            product: name,
            price: price,
            quantity: 1,
            currency: currency,
          )
        end

        def listing
          @listing ||= ::MapawynajmuPl::Listing.find(listing_id)
        end
      end
    end
  end
end
