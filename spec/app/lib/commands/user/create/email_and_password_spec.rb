# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Commands::User::Create::EmailAndPassword do
  subject { described_class.new(consents: consents, country_code: country_code, phone_number: phone_number, email: email, password: password, first_name: first_name, site_name: 'Warsawlease').call }

  let(:email) { 'test@example.net' }
  let(:password) { 'test_password' }
  let(:first_name) { 'Gandalf' }
  let(:country_code) { '+48'}
  let(:phone_number) { '123123123' }
  let(:consents) { [{ type: 'terms_and_conditions_and_privacy_policy', granted: true, displayed_text: 'Akceptuję Regulamin i Politykę Prywatności.' }] }

  context 'when email and password are valid' do
    it 'creates the user' do
      expect { subject }.to change(Warsawlease::User, :count).by(1)
    end
  end
end
