# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Api::User::Authorize::EmailAndPassword do
  let(:email) { 'test@example.net' }
  let(:password) { 'test_password' }
  let(:first_name) { 'Gandalf' }
  let(:verification_code) { '3067' }
  let(:verification) { [{ namespace: namespace, generated_at: '2021-03-23T08:07:13.189+01:00', encrypted_code: "a1R4FeRxjAJCddgqVV96Nrw73z2w6dGMkMRaaHZrxuaDOC+MC3TeQ09gj5tJ\nzQ4Q\n", encrypted_code_iv: "PRBFoeHuixemdQmc5X6C2Q==\n" }] }
  let(:namespace) { 'user/update/password' }

  describe 'PUT' do
    let!(:user) { create(:warsawlease_user, email: email, hashed_password: hashed_password, password_salt: password_salt, first_name: first_name) }
    let(:hashed_password) { '$2a$12$xNgbSunb3cSQmHKpSyUT.uFj9Msr8/Fuwngwir/.x65EKvrLzWsVy' }
    let(:password_salt) { '4f5d08e79c0987488a78577dc8e365621539e0e1a6bc333aee20d997809cd694' }

    before { put '/warsawlease/user/authorize/email-and-password', params: params }

    context 'when email and password are correct' do
      let(:params) { { email: email, password: password } }
      it 'returns :ok (200) response' do
        expect(response.status).to eq(200)
      end

      it 'returns the signed in user data' do
        expect(JSON.parse(response.body).symbolize_keys).to eq(
          accountType: nil,
          accessToken: 'ba79099602b5ca78b2c44b652ebee8c8ff0c522e93ab8a7a39ceeb60c3dc40d5fe9984cb45fe4464b4d48c3d6eba70040e6c1f9987c7177f259beee19dcd1a1e',
          name: 'Gandalf'
        )
      end
    end
  end
end
