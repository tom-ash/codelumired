# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Commands::User::Update::Verification do
  subject { described_class.new(user: user, namespace: namespace).call }

  let(:user) { Warsawlease::User.new }
  let(:namespace) { 'user/update/password' }

  it 'assigns the encrypted access token to user' do
    expect { subject }.to change { user.verification }.from(nil).to(
      [
        {
          namespace: namespace,
          generated_at: be_kind_of(String),
          encrypted_code: be_kind_of(String),
          encrypted_code_iv: be_kind_of(String)
        }.with_indifferent_access
      ]
    )
  end
end
