# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Api::User::Create::EmailAndPassword do
  # optional :business_name, type: String
  let(:email_address) { 'test@example.net' }
  let(:password) { 'test_password' }
  let(:country_code) { '+48' }
  let(:phone_number) { '123123123' }
  let(:headers) { { 'Lang': 'pl' } }
  let(:consents) do
    [{
      type: 'terms_of_service',
      granted: true,
      displayed_text: 'Akceptuję Regulamin i Politykę Prywatności.'
    }]
  end

  describe 'POST' do
    subject do
      post '/mapawynajmu-pl/user/create/email-and-password', params: params, headers: headers
    end

    context 'when params are valid' do
      let(:params) do
        {
          email_address: email_address,
          password: password,
          country_code: country_code,
          phone_number: phone_number,
          consents: consents
        }
      end

      it 'returns :created (201) response' do
        subject
        expect(response.status).to eq(201)
      end

      it 'creates a User record' do
        subject
        expect(::MapawynajmuPl::User.find_by!(email: email_address).reload).to be_truthy
      end
    end

    context 'when params are incomplete' do
      let(:params) { {} }

      it 'returns :bad_request (400) response' do
        subject
        expect(response.status).to eq(400)
      end
    end
  end

  describe 'PUT' do
    context 'when email and verification code are valid' do
      subject do
        put '/mapawynajmu-pl/user/create/email-and-password', params: params, headers: headers
      end

      let!(:user) { create(:mapawynajmu_pl_user, email: email_address) }
      let(:params) do
        {
          verification_token: verificationToken,
          verification_code: verificationCode,
        }
      end
      let(:verificationToken) do
        ::Ciphers::Jwt::Encoder.new(
          verificationCode: '4242',
          userId: user.id,
        ).call
      end
      let(:namespace) { 'user/create/email-and-password' }

      context 'when verification code is valid' do
        let(:verificationCode) { '4242' }

        it 'returns :ok (200) response' do
          subject
          expect(response.status).to eq(200)
        end
  
        it 'updates :email_verified_at from nil to current time' do
          expect { subject }.to change { user.reload.email_verified_at }.from(nil).to(be_within(5.second).of(Time.zone.now))
        end
      end

      context 'when verification code is invalid' do
        let(:verificationCode) { '2323' }

        it 'returns :unprocessable_entity (422) response' do
          subject
          expect(response.status).to eq(422)
        end
      end
    end
  end
end
