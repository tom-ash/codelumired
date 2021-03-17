# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Ciphers::User::DecryptAccessToken do
  subject { described_class.new(encrypted_access_token).call }

  let(:encrypted_access_token) { "GUKbtRcA4y3AQbd4GXgiRDp5QVORawx4QWRZXln30cEbIdJtYcEW6SQBZer1\nspEWaiAQ39BCr+E4qTBrlRwTyjYzjj3jG6frFyBAtomVebw=\n" }

  context 'when :iv and :salt are provided' do
    it 'decrypts the access token using secret :key and :iv' do
      expect(subject).to eq('test_access_token')
    end
  end
end
