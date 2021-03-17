# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Ciphers::User::GenerateAccessToken do
  subject { described_class.new(user).call }

  let(:user) do
    Warsawlease::User.new
  end

  it 'returns the generated access token' do
    expect(subject).to be_kind_of(String)
  end

  it 'assigns the encrypted access token to user' do
    expect { subject }.to change { user.encrypted_access_token }.from(nil).to(a_kind_of(String))
  end

  it 'assigns the access token date generation to user' do
    expect { subject }.to change { user.access_token_date }.from(nil).to(Date)
  end
end
