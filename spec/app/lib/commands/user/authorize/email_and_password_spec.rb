# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Commands::User::Authorize::EmailAndPassword do
  subject { described_class.new(email: email, password: password, site_name: 'MapawynajmuPl').call }

  let!(:user) { create(:warsawlease_user, email: email, hashed_password: hashed_password, password_salt: password_salt) }
  let(:email) { 'test@example.net' }
  let(:password) { 'test_password' }
  let(:hashed_password) { '$2a$12$xNgbSunb3cSQmHKpSyUT.uFj9Msr8/Fuwngwir/.x65EKvrLzWsVy' }
  let(:password_salt) { '4f5d08e79c0987488a78577dc8e365621539e0e1a6bc333aee20d997809cd694' }

  context 'when password is correct' do
    it 'authorizes the user' do
      expect { subject }.not_to raise_error
    end

    it 'returns the user' do
      expect(subject).to eq(user)
    end
  end

  context 'when password is incorrect' do
    let(:password) { 'invalid_password' }

    it 'raises PasswordError' do
      expect { subject }.to raise_error(::Commands::User::Authorize::EmailAndPassword::PasswordError)
    end
  end
end
