# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Ciphers::Encrypt do
  subject { described_class.new(attrs).call }
  let(:key) { 'wKsyp/n9o1KqcBMXC3t4i07UQUNMsenT73HUiy+P3yY' }
  let(:record) { 'test' }
  let(:attrs) { { key: key, record: record, iv: iv, salt: salt } }

  context 'when :iv and :salt are provided' do
    let(:iv) { 'tTxb17lyLXJTpBoLNAo6RA' }
    let(:salt) { 'test_salt' }

    it 'encrypts the record' do
      expect(subject[:encrypted_record]).to eq("IVxhDlpttH/8h0EkSy9eYw+y0RJojbQBQxf5ZA3tAIM=\n")
    end

    it 'returns :iv unchanged' do
      expect(subject[:iv]).to eq(iv)
    end

    it 'returns :salt unchanged' do
      expect(subject[:salt]).to eq(salt)
    end
  end

  context 'when :iv and :salt are not provided' do
    let(:iv) { nil }
    let(:salt) { nil }

    it 'encrypts the record' do
      expect(subject[:encrypted_record]).to be_kind_of(String)
    end

    it 'returns randomized :iv' do
      expect(subject[:iv]).to be_kind_of(String)
    end

    it 'returns randomized :salt' do
      expect(subject[:salt]).to be_kind_of(String)
    end
  end
end
