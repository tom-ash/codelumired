# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ::MapawynajmuPl::Api::Listing::CreateWithUser do
  let(:category) { 2 }
  let(:area) { 42.42 }
  let(:pictures) { [{ database: 'test_key', description: 'test_descriptiom' }] }
  let(:latitude) { 52.2248049 }
  let(:longitude) { 21.0115667 }
  let(:optional_attrs) { {} }
  let(:announcement) { { category: category, area: area, pictures: pictures, longitude: longitude, latitude: latitude }.merge(optional_attrs) }
  let(:email) { 'test@example.net' }
  let(:password) { 'test_password' }
  let(:first_name) { 'Gandalf' }
  let(:country_code) { '+48' }
  let(:phone_number) { '123123123' }
  let(:headers) { { 'Lang': 'pl' } }
  let(:consents) { [{ type: 'terms_of_service', granted: true, displayed_text: 'Akceptuję Regulamin i Politykę Prywatności.' }] }
  let(:user) { { email: email, password: password, first_name: first_name, country_code: country_code, phone_number: phone_number, consents: consents } }

  describe 'POST' do
    subject { post '/mapawynajmu_pl/announcement/create-with-user', params: params, headers: headers }

    context 'when all params are complete & valid' do
      let(:params) { { announcement: announcement, user: user } }

      it 'returns :created (201) response' do
        subject
        expect(response.status).to eq(201)
      end
    end
  end
end
