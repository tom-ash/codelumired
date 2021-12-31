# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Commands::User::Verify do
  subject { described_class.new(user: user, namespace: namespace, verification_code: verification_code).call }

  let(:user) { MapawynajmuPl::User.new(verification: verification) }
  let(:verification) { [verification_bundle] }
  let(:verification_bundle) { { namespace: namespace, encrypted_code: encrypted_code, encrypted_code_iv: encrypted_code_iv } }
  let(:namespace) { 'user/update/password' }
  let(:encrypted_code) { "syRbjw5YjnxghkqLvckiveMLVNEnY1qimNzf1eikFZPizezbD1Mvko72HNfH\nFyms\n" }
  let(:encrypted_code_iv) { "WR4ZxOZllsUdEMUdYPm5qQ==\n" }

  context 'when the provided code is correct' do
    let(:verification_code) { '1505' }

    it 'verifies the user' do
      expect { subject }.not_to raise_error
    end
  end

  context 'when the provided code is incorrect' do
    let(:verification_code) { '1550' }

    it 'raises CodeMismatchError' do
      expect { subject }.to raise_error(::Commands::User::Verify::CodeMismatchError)
    end
  end
end
