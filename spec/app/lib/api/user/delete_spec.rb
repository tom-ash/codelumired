# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Api::User::Delete do
  let(:email) { 'test@example.net' }
  let(:password) { 'test_password' }
  let(:access_token) { 'ba79099602b5ca78b2c44b652ebee8c8ff0c522e93ab8a7a39ceeb60c3dc40d5fe9984cb45fe4464b4d48c3d6eba70040e6c1f9987c7177f259beee19dcd1a1e' }
  let(:encrypted_access_token) { "jklIUPH3ggQD52/IMTyaoW1SL/bc3cRun0wstob6401/yLPDfIEC8pDWopbf\nS5+GoMAUPDKc+FV0y12ahoDTgrAekevOcIigfDIe8FwmljRF9rk6vDrhFo7u\nvp1VhNEuyVbCZEceIjqmkuz5RECIs83AjoKe2AB4Lnl9iqXBRskGz3Rj6pn9\nsTiFjdQfdPx/jQX1q5VKe8KgpCAbM89hefJ4CgEzHWW9t/2LZ3S0M9hZ4d0b\nKHBpqhdjKqzPg9x5\n" }
  let(:verification_code) { '3067' }
  let(:verification) { [{ namespace: namespace, generated_at: '2021-03-23T08:07:13.189+01:00', encrypted_code: "a1R4FeRxjAJCddgqVV96Nrw73z2w6dGMkMRaaHZrxuaDOC+MC3TeQ09gj5tJ\nzQ4Q\n", encrypted_code_iv: "PRBFoeHuixemdQmc5X6C2Q==\n" }] }
  let(:namespace) { 'user/delete' }

  describe '/delete' do
    describe 'PUT /verification' do
      let!(:user) { create(:warsawlease_user, email: email, encrypted_access_token: encrypted_access_token) }

      context 'when sending verification email is successful' do
        it 'returns :ok (200)' do
          put '/mapawynajmu_pl/user/delete/verification', headers: { 'Access-Token': access_token, 'Lang': 'pl' }
          expect(response.status).to eq(200)
        end
      end
    end

    describe 'DELETE /' do
      let!(:user) { create(:warsawlease_user, email: email, encrypted_access_token: encrypted_access_token, verification: verification) }

      context 'user deletion is successful' do
        it 'returns :ok (200)' do
          delete '/mapawynajmu_pl/user/delete', params: { verification_code: verification_code }, headers: { 'Access-Token': access_token, 'Lang': 'pl' }
          expect(response.status).to eq(200)
        end

        it 'deletes the user' do
          delete '/mapawynajmu_pl/user/delete', params: { verification_code: verification_code }, headers: { 'Access-Token': access_token, 'Lang': 'pl' }
          expect(MapawynajmuPl::User.exists?(user.id)).to be(false)
        end

        it 'creates DeletedUser' do
          delete '/mapawynajmu_pl/user/delete', params: { verification_code: verification_code }, headers: { 'Access-Token': access_token, 'Lang': 'pl' }
          expect(MapawynajmuPl::DeletedUser.find(user.id)).to be_truthy
        end
      end
    end
  end
end
