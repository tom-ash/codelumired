# frozen_string_literal: true

require 'skillfind_tech/rails_helper'

RSpec.describe ::SkillfindTech::Api::Methods::Postings do
  let(:accessToken) { accessToken = ::Ciphers::Jwt::Encoder.new(id: user.id).call }
  let(:headers) do
    {
      'Access-Token': accessToken,
      'Lang': 'pl',
    }
  end
  let(:params) do
    {
      position: 'Fullstack JavaScript Developer',
      cooperation_mode: 'remote',
      lat: 52,
      lng: 12,
      place_id: 'test',
      place_autocomplete: 'test',
      employment: false,
      image: 'test',
      form_application_manner: true,
      link_application_manner: false,
      country: 'test',
      locality: 'test',
      selected_skills: [
        {
          value: 'JavaScript',
          level: 4,
        },
        {
          value: 'Ruby',
          level: 4,
        }
      ],
      b2b: false,
    }
  end

  describe 'create' do
    before(:each) do
      create(:javascript_skill)
      create(:ruby_skill)

      allow(Aws::S3::Object).to receive(:new).and_return(double(move_to: nil))
    end

    describe 'POST /promote' do
      let(:user) { create(:skillfind_tech_user) }

      context 'when sending verification email is successful' do
        it 'returns :ok (200)' do
          post '/skillfind-tech/postings', headers: headers, params: params
          expect(response.status).to eq(201)
        end

        it 'creates a new Posting record' do
          expect { post '/skillfind-tech/postings', headers: headers, params: params }.to change(::SkillfindTech::Posting, :count).by(1)
        end

        it 'creates a new SelectedSkill records' do
          expect { post '/skillfind-tech/postings', headers: headers, params: params }.to change(::SkillfindTech::SelectedSkill, :count).by(2)
        end
      end
    end
  end
end
