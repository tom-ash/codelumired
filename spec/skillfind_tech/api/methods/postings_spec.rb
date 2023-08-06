# frozen_string_literal: true

require 'skillfind_tech/rails_helper'


RSpec.describe ::SkillfindTech::Api::Methods::Postings do
  let(:accessToken) { accessToken = ::Ciphers::Jwt::Encoder.new(id: user.id).call }
  let(:headers) do
    {
      'Access-Token': accessToken,
      'Lang': 'pl',
    }
  end
  let(:params) do
    {
      selected_skills: [],
      b2b: false,
      # requires :remote, type: Boolean
      # requires :hybrid, type: Boolean
      # requires :office, type: Boolean
      # requires :b2b, type: Boolean
      # requires :selected_skills, type: Array
      # # requires :remote, type: Boolean
      # # requires :hybrid, type: Boolean
      # # requires :office, type: Boolean
      # requires :b2b, type: Boolean
      # optional :b2b_min, type: Integer
      # optional :b2b_max, type: Integer
    }
  end

  describe '/promote' do
    describe 'POST /promote' do
      # let(:listing) { create(:mapawynajmu_pl_listing, user: user) }
      let(:user) { create(:skillfind_tech_user) }

      context 'when sending verification email is successful' do
        it 'returns :ok (200)' do
          post '/skillfind-tech/postings', headers: headers, params: params
          expect(response.status).to eq(201)
        end

        it 'TODO' do
          post '/skillfind-tech/postings', headers: headers, params: params

          body = JSON.parse(response.body)

          # byebug

          # expect(JSON.parse(response.body)).to match(/^https:\/\/merch-prod.snd.payu.com\/pay\/\?orderId=/)
        end

        # it 'sets listing :is_promoted to true' do
        #   post '/mapawynajmu-pl/listings/promote', headers: headers, params: params
        #   expect(listing.reload.is_promoted).to be(true)
        # end
      end
    end
  end
end
