# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Commands::User::Authorize::AccessToken do
  subject { described_class.new(access_token: access_token, site_name: 'MapawynajmuPl').call }

  let(:access_token) { 'ba79099602b5ca78b2c44b652ebee8c8ff0c522e93ab8a7a39ceeb60c3dc40d5fe9984cb45fe4464b4d48c3d6eba70040e6c1f9987c7177f259beee19dcd1a1e' }
  let!(:user) { create(:warsawlease_user, encrypted_access_token: encrypted_access_token) }
  let(:encrypted_access_token) { "jklIUPH3ggQD52/IMTyaoW1SL/bc3cRun0wstob6401/yLPDfIEC8pDWopbf\nS5+GoMAUPDKc+FV0y12ahoDTgrAekevOcIigfDIe8FwmljRF9rk6vDrhFo7u\nvp1VhNEuyVbCZEceIjqmkuz5RECIs83AjoKe2AB4Lnl9iqXBRskGz3Rj6pn9\nsTiFjdQfdPx/jQX1q5VKe8KgpCAbM89hefJ4CgEzHWW9t/2LZ3S0M9hZ4d0b\nKHBpqhdjKqzPg9x5\n" }

  context 'when the access token is correct' do
    it 'authorizes the user' do
      expect { subject }.not_to raise_error
    end

    it 'returns the user' do
      expect(subject).to eq(user)
    end
  end

  context 'when the access token is incorrect' do
    let(:access_token) { 'invalid_access_token' }

    it 'raises AccessTokenError' do
      expect { subject }.to raise_error(::Commands::User::Authorize::AccessToken::AccessTokenError)
    end
  end
end
