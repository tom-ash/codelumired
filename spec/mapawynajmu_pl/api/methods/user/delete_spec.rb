# frozen_string_literal: true

require 'mapawynajmu_pl/rails_helper.rb'

RSpec.describe ::Api::User::Delete do
  let(:accessToken) { accessToken = ::Ciphers::Jwt::Encoder.new(id: user.id).call }
  let(:password) { 'test_password' }
  let(:headers) do
    {
      'Access-Token': accessToken,
      'Lang': 'pl',
    }
  end

  describe '/delete' do
    describe 'PUT /verification' do
      let!(:user) { create(:mapawynajmu_pl_user) }

      context 'when sending verification email is successful' do
        it 'returns :ok (200)' do
          put '/mapawynajmu-pl/user/delete/verification', headers: headers
          expect(response.status).to eq(200)
        end
      end
    end

    describe 'DELETE /' do
      subject { delete '/mapawynajmu-pl/user/delete', params: params, headers: headers }

      let!(:user) { create(:mapawynajmu_pl_user) }
      let(:verificationToken) do
        ::Ciphers::Jwt::Encoder.new(
          verificationCode: '4242',
          userId: user.id,
        ).call
      end
      let(:params) do
        {
          verification_token: verificationToken,
          verification_code: '4242',
        }
      end

      context 'when verificationToken & verificationCode are valid' do
        it 'returns :ok (200)' do
          subject
          expect(response.status).to eq(200)
        end

        it 'deletes the user' do
          subject
          expect(MapawynajmuPl::User.find(user.id).deleted_at).to be_truthy
        end
      end

      context 'when verificationCode is invalid' do
        let(:params) do
          {
            verification_token: verificationToken,
            verification_code: '2323',
          }
        end

        it 'returns :unprocessable_entity (422)' do
          subject
          expect(response.status).to eq(422)
        end
      end
    end
  end
end
