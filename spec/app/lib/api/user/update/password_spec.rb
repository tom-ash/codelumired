# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe ::Api::User::Update::Password do
#   let(:email) { 'test@example.net' }
#   let(:password) { 'test_password' }
#   let(:verification_code) { '3067' }
#   let(:verification) { [{ namespace: namespace, generated_at: '2021-03-23T08:07:13.189+01:00', encrypted_code: "a1R4FeRxjAJCddgqVV96Nrw73z2w6dGMkMRaaHZrxuaDOC+MC3TeQ09gj5tJ\nzQ4Q\n", encrypted_code_iv: "PRBFoeHuixemdQmc5X6C2Q==\n" }] }
#   let(:namespace) { 'user/update/password' }

#   describe '/update/password' do
#     let!(:user) { create(:mapawynajmu_pl_user, email: email, verification: verification) }
#     let(:params) { { email: email, password: 'new_test_password', verification_code: verification_code } }
#     let(:namespace) { 'user/update/password' }

#     describe 'PUT /verification' do
#       subject { put '/mapawynajmu_pl/user/update/password/verification', params: { email: email }, headers: { 'Lang': 'pl' } }

#       context 'when sending verification email is successful' do
#         it 'returns :ok (200)' do
#           subject
#           expect(response.status).to eq(200)
#         end
#       end
#     end

#     describe 'PUT /verify' do
#       subject { put '/mapawynajmu_pl/user/update/password/verify', params: params, headers: { 'Lang': 'pl' } }
#       let(:params) { { email: email, verification_code: verification_code } }

#       context 'when verification code is valid' do
#         it 'returns :ok (200)' do
#           subject
#           expect(response.status).to eq(200)
#         end
#       end

#       context 'when verification code is invalid' do
#         let(:verification_code) { 'invalid_verification_code' }

#         it 'returns :unprocessable_entity (422)' do
#           subject
#           expect(response.status).to eq(422)
#         end
#       end
#     end

#     describe 'PUT /' do
#       subject { put '/mapawynajmu_pl/user/update/password', params: params }

#       it 'returns :ok (200)' do
#         subject
#         expect(response.status).to eq(200)
#       end

#       it 'changes the password' do
#         expect { subject }.to change { user.reload.hashed_password }.from('$2a$12$pm9aETt3XZNW6R1MMlXgz.jE1OeGmTquN2In0YBWaFSmTMMtj/M1e').to(kind_of(String))
#       end

#       it 'changes the password salt' do
#         expect { subject }.to change { user.reload.password_salt }.from('3a72e9ee7cb8a118996301e9ae55d93a11441264cf3aa0190fde39c46083dde3').to(kind_of(String))
#       end
#     end
#   end
# end
