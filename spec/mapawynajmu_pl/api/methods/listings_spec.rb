# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::MapawynajmuPl::Api::Methods::Listings do
  let(:accessToken) { accessToken = ::Ciphers::Jwt::Encoder.new(id: user.id).call }
  let(:headers) do
    {
      'Access-Token': accessToken,
      'Lang': 'pl',
    }
  end
  let(:params) do
    {
      listing_id: listing.id
    }
  end

  describe '/promote' do
    describe 'POST /promote' do
      let(:listing) { create(:mapawynajmu_pl_listing, user: user) }
      let(:user) { create(:mapawynajmu_pl_user) }

      context 'when sending verification email is successful' do
        # TODO!: Mock HTTP!!!
        it 'returns :ok (200)' do
          post '/mapawynajmu-pl/listings/promote', headers: headers, params: params
          expect(response.status).to eq(201)
        end

        it 'returns PayU order link in body' do
          post '/mapawynajmu-pl/listings/promote', headers: headers, params: params
          expect(JSON.parse(response.body)).to match(/^https:\/\/merch-prod.snd.payu.com\/pay\/\?orderId=/)
        end

        it 'sets listing :is_promoted to true' do
          post '/mapawynajmu-pl/listings/promote', headers: headers, params: params
          expect(listing.reload.is_promoted).to be(true)
        end
      end
    end
  end
end
