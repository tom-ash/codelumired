# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Api::User::Update::Email do
  let(:current_email_verification_code) { '9762' }
  let(:current_email_verification) { { namespace: current_email_verification_namespace, generated_at: '2021-03-29T08:29:54.373+02:00', encrypted_code: "TpPEfhaLy5as0e/Jp+lEvWdiv4eqhigs4d7ZZTSsHPJNV/Fi4ALGn/G5UOoB\n28ql\n", encrypted_code_iv: "lOTADr6NpBh94ObwK0HoOQ==\n" } }
  let(:current_email_verification_namespace) { 'user/update/email/current' }
  let(:new_email_verification_code) { '1566' }
  let(:new_email_verification) { { namespace: new_email_verification_namespace, generated_at: '2021-03-29T08:34:36.336+02:00', encrypted_code: "vbkRU9eacx29FzKPWTmld5MuC2eTw4y9TwSGKOipTWSwuLgSNvn8GKfjSw34\nFED0\n", encrypted_code_iv: "ZCLtZ8D9Zvv6bXM3Lo7ggg==\n" } }
  let(:new_email_verification_namespace) { 'user/update/email/new' }
  let!(:user) { create(:mapawynajmu_pl_user, email: current_email, hashed_password: hashed_password, password_salt: password_salt, verification: verification, encrypted_access_token: encrypted_access_token) }
  let(:current_email) { 'test@example.net' }
  let(:new_email) { 'new_test@example.net' }
  let(:access_token) { 'ba79099602b5ca78b2c44b652ebee8c8ff0c522e93ab8a7a39ceeb60c3dc40d5fe9984cb45fe4464b4d48c3d6eba70040e6c1f9987c7177f259beee19dcd1a1e' }
  let(:encrypted_access_token) { "jklIUPH3ggQD52/IMTyaoW1SL/bc3cRun0wstob6401/yLPDfIEC8pDWopbf\nS5+GoMAUPDKc+FV0y12ahoDTgrAekevOcIigfDIe8FwmljRF9rk6vDrhFo7u\nvp1VhNEuyVbCZEceIjqmkuz5RECIs83AjoKe2AB4Lnl9iqXBRskGz3Rj6pn9\nsTiFjdQfdPx/jQX1q5VKe8KgpCAbM89hefJ4CgEzHWW9t/2LZ3S0M9hZ4d0b\nKHBpqhdjKqzPg9x5\n" }
  let(:hashed_password) { '$2a$12$6Q/W2ktpavYYo1p7Iwu43.LwzX5cbFjDuPo9OhpnTzceXNucfDiDO' }
  let(:password_salt) { 'da777f46224579e900a46e9b6c59f085ce456909ddb6cc2de9aacdaf3e47a262' }

  describe '/user/update/email' do
    describe 'current/verification' do
      subject { put '/mapawynajmu_pl/user/update/email/current/verification', headers: { 'Access-Token': access_token, 'Lang': 'pl' } }

      let(:verification) { [] }

      context 'when dispatching verification is successful' do
        it 'returns :ok (200)' do
          subject
          expect(response.status).to eq(200)
        end
      end
    end

    describe '/current/verify' do
      subject { put '/mapawynajmu_pl/user/update/email/current/verify', params: params, headers: { 'Access-Token': access_token, 'Lang': 'pl' } }

      let(:params) { { verification_code: current_email_verification_code } }
      let(:verification) { [current_email_verification] }

      context 'when verification code is valid' do
        it 'returns :ok (200)' do
          subject
          expect(response.status).to eq(200)
        end
      end
    end

    describe 'new/verification' do
      subject { put '/mapawynajmu_pl/user/update/email/new/verification', params: params, headers: { 'Access-Token': access_token, 'Lang': 'pl' } }

      let(:params) { { email: new_email } }
      let(:verification) { [] }

      context 'when dispatching verification is successful' do
        it 'returns :ok (200)' do
          subject
          expect(response.status).to eq(200)
        end
      end
    end

    describe 'PUT /new/verify' do
      subject { put '/mapawynajmu_pl/user/update/email/new/verify', params: params, headers: { 'Access-Token': access_token, 'Lang': 'pl' } }

      let(:params) { { verification_code: new_email_verification_code } }
      let(:verification) { [current_email_verification, new_email_verification] }

      context 'when verification code is valid' do
        it 'returns :ok (200)' do
          subject
          expect(response.status).to eq(200)
        end
      end
    end

    describe 'PUT' do
      subject { put '/mapawynajmu_pl/user/update/email', params: params, headers: { 'Access-Token': access_token, 'Lang': 'pl' } }

      let(:params) { { current_email: current_email, current_email_verification_code: current_email_verification_code, new_email: new_email, new_email_verification_code: new_email_verification_code, client_hashed_password: client_hashed_password, client_rehashed_password: client_rehashed_password } }
      let(:verification) { [current_email_verification, new_email_verification] }
      let(:client_hashed_password) { '302a62d6a4a651966b411c6697685ab464cfbde6ec7036a46f8b60a04dbf66d25ed795f15f5b8e6b12883216eeb72e3474821e97afad47d55880f4c48efb426e628174c99eabbc441d9266866844d24ba16840275639134d545a1e6152cbe4ec07ba23291047bc393af11a5576fd0928e9d0d2160c7ec5343345527b183b796f' }
      let(:client_rehashed_password) { 'd5f12a6a420689a9a0ad30028ee04b9626e91350b8dbf1a82a9f9b67978f13ce5ba1225f9bae02fa101b4cf4e1a58f319a07542d78f637700cd4fcdb70d79bffef0a4fa21887d6357e15e9e3261533b4e7b9d1bba65003f45e73ca4524578efbc56d1e0c3c531c7745f5e9b93e79cbcd6b6a1faa23c18bcac02f0491c8cccf0c' }

      context 'when verification code is valid' do
        it 'returns :ok (200)' do
          subject
          expect(response.status).to eq(200)
        end

        it 'updates :email to the new email' do
          expect { subject }.to change { user.reload.email }.from(current_email).to(new_email)
        end
      end
    end
  end
end
