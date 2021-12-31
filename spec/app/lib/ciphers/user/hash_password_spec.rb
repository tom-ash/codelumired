# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::Ciphers::User::HashPassword do
  subject { described_class.new(user: user, password: password).call }

  let(:user) { MapawynajmuPl::User.new }
  let(:password) { 'test_password' }

  it 'assigns the hashed passsword to the user' do
    expect { subject }.to change { user.hashed_password }.from(nil).to(a_kind_of(String))
  end

  it 'assigns the password salt to the user' do
    expect { subject }.to change { user.password_salt }.from(nil).to(a_kind_of(String))
  end
end
