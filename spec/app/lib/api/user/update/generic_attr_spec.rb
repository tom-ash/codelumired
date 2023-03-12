# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Api::User::Update::Attribute do
  subject { put '/mapawynajmu_pl/user/update/generic-attr/first_name', params: params, headers: { 'Access-Token': access_token, 'Lang': 'pl' } }
  let!(:user) { create(:mapawynajmu_pl_user, first_name: first_name) }
  let(:first_name) { 'Gandalf the Gray' }
  let(:access_token) { 'ba79099602b5ca78b2c44b652ebee8c8ff0c522e93ab8a7a39ceeb60c3dc40d5fe9984cb45fe4464b4d48c3d6eba70040e6c1f9987c7177f259beee19dcd1a1e' }
  let(:encrypted_access_token) { "jklIUPH3ggQD52/IMTyaoW1SL/bc3cRun0wstob6401/yLPDfIEC8pDWopbf\nS5+GoMAUPDKc+FV0y12ahoDTgrAekevOcIigfDIe8FwmljRF9rk6vDrhFo7u\nvp1VhNEuyVbCZEceIjqmkuz5RECIs83AjoKe2AB4Lnl9iqXBRskGz3Rj6pn9\nsTiFjdQfdPx/jQX1q5VKe8KgpCAbM89hefJ4CgEzHWW9t/2LZ3S0M9hZ4d0b\nKHBpqhdjKqzPg9x5\n" }

  describe 'PUT /' do
    let(:params) { { value: 'Gandalf the White' } }

    context 'when update is successfull' do
      it 'returns :ok (200)' do
        subject
        expect(response.status).to eq(200)
      end

      it 'updates the attribute value' do
        expect { subject }.to change { user.reload.first_name }.from('Gandalf the Gray').to('Gandalf the White')
      end
    end
  end
end
