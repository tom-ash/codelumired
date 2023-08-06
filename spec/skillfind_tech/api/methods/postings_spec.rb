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
      selected_skills: [
        {
          name: 'JavaScript',
          level: 5,
        },
        {
          name: 'Ruby',
          level: 5,
        }
      ],
      b2b: false,
      # requires :remote, type: Boolean
      # requires :hybrid, type: Boolean
      # requires :office, type: Boolean
      # requires :b2b, type: Boolean
      # requires :selected_skills, type: Array
      # # requires :remote, type: Boolean
      # # requires :hybrid, type: Boolean
      # # requires :office, type: Boolean
      # requires :b2b, type: Boolean
      # optional :b2b_min, type: Integer
      # optional :b2b_max, type: Integer
    }
  end

  describe '/promote' do
    before(:each) do
      create(:javascript_skill)
      create(:ruby_skill)
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
