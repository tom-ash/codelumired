# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Api::User::Authorize::EmailAndPassword do
  let(:email) { 'test@example.net' }
  let(:password) { 'test_password' }
  let(:headers) { { 'Lang': 'pl' } }

  describe 'PUT' do
    let(:hashed_password) { '$2a$12$xNgbSunb3cSQmHKpSyUT.uFj9Msr8/Fuwngwir/.x65EKvrLzWsVy' }
    let(:password_salt) { '4f5d08e79c0987488a78577dc8e365621539e0e1a6bc333aee20d997809cd694' }

    context 'when user is active' do
      context 'when email and password are valid' do
        let(:params) { { email: email, password: password } }

        before do
          create(
            :mapawynajmu_pl_user,
            email: email,
            hashed_password: hashed_password,
            password_salt: password_salt,
          )

          put '/mapawynajmu-pl/user/auth/email-and-password', params: params, headers: headers
        end

        it 'returns :ok (200) response' do
          expect(response.status).to eq(200)
        end
    
        it 'returns the signed in user data' do
          expect(JSON.parse(response.body).symbolize_keys).to include(
            accessToken: be_an_instance_of(String),
            href: 'http://local.mapawynajmu.pl:8080/'
          )
        end
      end
    end

    context 'when user is deleted' do
      context 'when email and password are valid' do
        let(:params) { { email: email, password: password } }

        before do
          create(
            :mapawynajmu_pl_user,
            email: email,
            hashed_password: hashed_password,
            password_salt: password_salt,
            deleted_at: Time.now,
          )

          put '/mapawynajmu-pl/user/auth/email-and-password', params: params, headers: headers
        end

        # TODO!: Change 400 to 422.
        it 'returns :bad_request (400) response' do
          expect(response.status).to eq(400)
        end
      end
    end
  end
end
