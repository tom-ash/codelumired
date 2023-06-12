# frozen_string_literal: true

module MapawynajmuPl
  module Commands
    module Order
      class Create
        def initialize(attrs)
          @listing_id = attrs[:listing_id]
          @name = attrs[:name]
          @price = attrs[:price]
          @currency = attrs[:currency]
        end

        def call
          res = create_order_at_payu
          @orderId = res['orderId']
          create_order_in_database
          res['redirectUri']
        end

        attr_reader :listing_id, :name, :payu_merchant_pos_id, :price, :currency

        private

        def create_order_at_payu
          uri = URI('https://secure.snd.payu.com/api/v2_1/orders')

          req_body = {
            notifyUrl: 'https://warsaw-digital-server.herokuapp.com/payu/notify',
            continueUrl: "http://local.mapawynajmu.pl:8080/podsumowanie-dodanego-ogloszenia/#{listing_id}",
            customerIp: '127.0.0.1',
            merchantPosId: 466926,
            description: name,
            currencyCode: currency,
            totalAmount: price,
            buyer: {
              'language': 'pl'
            },
            products: [
                {
                    'name': name,
                    'unitPrice': price,
                    'quantity': 1
                }
            ]
          }

          res = Net::HTTP.post uri,
                req_body.to_json,
                'Authorization' => 'Bearer 8454a27c-c982-4370-836e-030c13e98a23',
                'Content-Type' => 'application/json'

          JSON.parse(res.body)
        end

        def create_order_in_database
          ::MapawynajmuPl::Order.create!(
            announcement_id: listing_id,
            payu_order_id: @orderId,
            status: 'pending',
            payu_merchant_pos_id: 466926,
            product: name,
            price: price,
            quantity: 1,
            currency: currency,
          )
        end
      end
    end
  end
end
