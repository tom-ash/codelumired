# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Ciphers::User::EncryptAccessToken do
  subject { described_class.new(access_token).call }

  let(:access_token) { 'test_access_token' }

  it 'encrypts the access token using secret :key, :iv and :salt' do
    expect(subject).to eq("GUKbtRcA4y3AQbd4GXgiRDp5QVORawx4QWRZXln30cEbIdJtYcEW6SQBZer1\nspEWaiAQ39BCr+E4qTBrlRwTyjYzjj3jG6frFyBAtomVebw=\n")
  end
end
