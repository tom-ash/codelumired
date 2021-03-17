# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Api::User::Create::EmailAndPassword do
  let(:email) { 'test@example.net' }
  let(:password) { 'test_password' }
  let(:first_name) { 'Gandalf' }
  let(:country_code) { '+48' }
  let(:phone_number) { '123123123' }
  let(:headers) { { 'Lang': 'pl' } }
  let(:consents) { [{ type: 'terms_and_conditions_and_privacy_policy', granted: true, displayed_text: 'Akceptuję Regulamin i Politykę Prywatności.' }] }

  describe 'POST' do
    subject { post '/warsawlease/user/create/email-and-password', params: params, headers: headers }

    context 'when all params are complete & valid' do
      let(:params) { { email: email, password: password, first_name: first_name, country_code: country_code, phone_number: phone_number, consents: consents } }

      it 'returns :created (201) response' do
        subject
        expect(response.status).to eq(201)
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
      subject { put '/warsawlease/user/create/email-and-password', params: params }

      let!(:user) { create(:warsawlease_user, email: email, verification: verification) }
      let(:params) { { email: email, verification_code: verification_code } }
      let(:verification_code) { '3067' }
      let(:verification) { [{ namespace: namespace, generated_at: '2021-03-23T08:07:13.189+01:00', encrypted_code: "a1R4FeRxjAJCddgqVV96Nrw73z2w6dGMkMRaaHZrxuaDOC+MC3TeQ09gj5tJ\nzQ4Q\n", encrypted_code_iv: "PRBFoeHuixemdQmc5X6C2Q==\n" }] }
      let(:namespace) { 'user/create/email-and-password' }

      it 'returns :ok (200) response' do
        subject
        expect(response.status).to eq(200)
      end

      it 'updates :email_confirmed_at from nil to current time' do
        expect { subject }.to change { user.reload.email_confirmed_at }.from(nil).to(be_within(5.second).of(Time.zone.now))
      end
    end
  end
end
