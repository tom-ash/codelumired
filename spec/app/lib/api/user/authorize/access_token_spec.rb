# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Api::User::Authorize::AccessToken do
  let(:account_type) { 'private' }
  let(:first_name) { 'Gandalf' }
  let(:access_token) { 'ba79099602b5ca78b2c44b652ebee8c8ff0c522e93ab8a7a39ceeb60c3dc40d5fe9984cb45fe4464b4d48c3d6eba70040e6c1f9987c7177f259beee19dcd1a1e' }
  let(:encrypted_access_token) { "jklIUPH3ggQD52/IMTyaoW1SL/bc3cRun0wstob6401/yLPDfIEC8pDWopbf\nS5+GoMAUPDKc+FV0y12ahoDTgrAekevOcIigfDIe8FwmljRF9rk6vDrhFo7u\nvp1VhNEuyVbCZEceIjqmkuz5RECIs83AjoKe2AB4Lnl9iqXBRskGz3Rj6pn9\nsTiFjdQfdPx/jQX1q5VKe8KgpCAbM89hefJ4CgEzHWW9t/2LZ3S0M9hZ4d0b\nKHBpqhdjKqzPg9x5\n" }

  describe 'PUT' do
    let!(:user) { create(:warsawlease_user, account_type: account_type, first_name: first_name, encrypted_access_token: encrypted_access_token) }

    before { put '/warsawlease/user/authorize/access-token', headers: { 'Access-Token': access_token } }

    context 'when access token is valid' do
      it 'returns :ok (200) response' do
        expect(response.status).to eq(200)
      end

      it 'returns the serialized authorized user data' do
        expect(JSON.parse(response.body).symbolize_keys).to eq(
          accountType: account_type,
          accessToken: access_token,
          name: first_name
        )
      end
    end

    context 'when access token is invalid' do
      let(:access_token) { 'invalid_access_token' }

      it 'returns :unauthorized (401) response' do
        expect(response.status).to eq(401)
      end
    end
  end
end
