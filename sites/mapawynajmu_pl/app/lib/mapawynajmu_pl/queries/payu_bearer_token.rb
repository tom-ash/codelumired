# frozen_string_literal: true

module MapawynajmuPl
  module Queries
    class PayuBearerToken
      def call
        uri = URI("#{ENV['PAYU_OAUTH_AUTHORIZE_URL']}?grant_type=client_credentials&client_id=#{ENV['PAYU_CLIENT_ID']}&client_secret=#{ENV['PAYU_CLIENT_SECRET']}")

        res = Net::HTTP.get_response(uri)
        JSON.parse(res.body)
      end
    end
  end
end
