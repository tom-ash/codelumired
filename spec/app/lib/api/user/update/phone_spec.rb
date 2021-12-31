# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Api::User::Update::Phone do
  let!(:user) { create(:mapawynajmu_pl_user, phone: phone) }
  let(:phone) { { code: '+48', body: '123123123', verified: true } }
  let(:access_token) { 'ba79099602b5ca78b2c44b652ebee8c8ff0c522e93ab8a7a39ceeb60c3dc40d5fe9984cb45fe4464b4d48c3d6eba70040e6c1f9987c7177f259beee19dcd1a1e' }
  let(:encrypted_access_token) { "jklIUPH3ggQD52/IMTyaoW1SL/bc3cRun0wstob6401/yLPDfIEC8pDWopbf\nS5+GoMAUPDKc+FV0y12ahoDTgrAekevOcIigfDIe8FwmljRF9rk6vDrhFo7u\nvp1VhNEuyVbCZEceIjqmkuz5RECIs83AjoKe2AB4Lnl9iqXBRskGz3Rj6pn9\nsTiFjdQfdPx/jQX1q5VKe8KgpCAbM89hefJ4CgEzHWW9t/2LZ3S0M9hZ4d0b\nKHBpqhdjKqzPg9x5\n" }

  describe 'PUT phone' do
    subject { put '/mapawynajmu_pl/user/update/phone', params: params, headers: { 'Access-Token': access_token } }

    let(:params) { { country_code: '+1', phone_number: '555555555'} }

    context 'when update is successfull' do
      it 'returns :ok (200)' do
        subject
        expect(response.status).to eq(200)
      end

      it 'updates the attribute value' do
        expect { subject }.to change { user.reload.phone.symbolize_keys }.from(code: '+48', body: '123123123', verified: true).to(code: '+1', body: '555555555', verified: true)
      end
    end
  end
end
