# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe ::Ciphers::Decrypt do
#   subject { described_class.new(attrs).call }
#   let(:key) { 'wKsyp/n9o1KqcBMXC3t4i07UQUNMsenT73HUiy+P3yY' }
#   let(:iv) { 'tTxb17lyLXJTpBoLNAo6RA' }
#   let(:encrypted_record) { "IVxhDlpttH/8h0EkSy9eYw+y0RJojbQBQxf5ZA3tAIM=\n" }
#   let(:attrs) { { key: key, encrypted_record: encrypted_record, iv: iv } }

#   it 'returns decrypted record' do
#     expect(subject).to eq('test')
#   end
# end
