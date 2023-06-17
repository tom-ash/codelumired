# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Orders
      class Notify < Grape::API
        # {
        #   "order" => {
        #     "order_id" => "ZF2ZSVJG1T230615GUEST000P01", 
        #     "status" => "COMPLETED",
        #   },
        #   "properties" => [{
        #     "name" => "PAYMENT_ID",
        #     "value" => "5007680991"
        #   }]
        # }

        # https://developers.payu.com/en/restapi.html#notifications

        params do
          requires :order, type: Hash do
            requires :order_id, type: String
            requires :status, type: String
          end
        end

        post do
          status 200

          order_params = params[:order]
          order_id = order_params[:order_id]
          order_status = order_params[:status]

          if order_status == 'COMPLETED'
            order = ::MapawynajmuPl::Order.find_by(payu_order_id: order_id)

            # TODO: Add PAYMENT_ID to order.
            order.update(status: order_status, paid_at: Time.zone.now)
          end
        end
      end
    end
  end
end
