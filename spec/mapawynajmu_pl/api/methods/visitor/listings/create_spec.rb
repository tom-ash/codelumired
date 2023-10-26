# frozen_string_literal: true

require 'mapawynajmu_pl/rails_helper.rb'

RSpec.describe ::MapawynajmuPl::Api::Listing::Create::WithUser do
  let(:create_listing_as_visitor) do
    post '/mapawynajmu-pl/announcement/create/with-user', headers: headers, params: params
  end
  let(:headers) do
    {
      'Lang': 'pl',
    }
  end
  let(:params) do
    {
      announcement: listing_attributes,
      user: user_attributes,
    }
  end
  let(:listing_attributes) do
    {
      category: 0,
      latitude: 42,
      longitude: 42,
      pictures: [
        {
          database: '20230925173842604QpWEWHxp-xQG4FoAR0drEA.jpeg',
          description: ''
        }
      ],
      add_promotion: false,
    }
  end
  let(:email) { 'test@example.net' }
  let(:user_attributes) do
    {
      # account_type # TODO!!!
      email_address: email,
      password: 'test-password',
      country_code: '+48',
      phone_number: '500100200',
      terms_of_service_consent: true,
      consents: [
        {
          type: 'terms_of_service',
          granted: true,
          displayed_text: 'Oświadczam, że znam i akceptuję postanowienia Regulaminu mapawynajmu.pl.'
        }
      ]
    }
  end
  let(:body) { JSON.parse(response.body).deep_symbolize_keys }

  before do
    allow_any_instance_of(PersistedObject).to receive(:move_to)
  end

  describe '/announcement/create/with-user' do
    describe 'listing attributes' do
      describe 'required attributes' do
        context 'when required attributes are present & valid' do  
          it 'responds with :created (201) status' do
            create_listing_as_visitor
            expect(response.status).to eq(201)
          end

          it'responds with verificationToken including userId & 4-digit verificationCode' do
            create_listing_as_visitor

            verificationToken = body[:verificationToken]
            decodedVerificationToken = ::Ciphers::Jwt::Decoder.new(verificationToken).call.to_h

            userId = ::MapawynajmuPl::User.find_by(email: email).id
            verificationCode = decodedVerificationToken[:verificationCode]

            expect(decodedVerificationToken).to include(
              userId: userId,
              verificationCode: verificationCode,
            )
            expect(verificationCode).to match(/^\d{4}$/)
          end

          it 'responds with redirection path' do
            create_listing_as_visitor
            expect(body[:path]).to eq('potwierdz-adres-email')
          end

          it 'creates a new unverified listing' do
            expect { create_listing_as_visitor }.to change { ::MapawynajmuPl::Listing.count }.by(1)
          end

          it 'creates a new unverified user' do
            expect { create_listing_as_visitor }.to change { ::MapawynajmuPl::User.count }.by(1)
          end
        end
      end

      describe 'optional attributes' do
        context 'when optional attributes are present & valid' do  
          let(:listing_attributes) do
            {
              category: 0,
              latitude: 42,
              longitude: 42,
              pictures: [
                {
                  database: '20230925173842604QpWEWHxp-xQG4FoAR0drEA.jpeg',
                  description: ''
                }
              ],
              locality: 'Warszawa',
              sublocality: 'Ochota',
              route: 'Aleje Jerozolimskie',
              area: 42.42,
              rent_currency: 0,
              net_rent_amount: 100,
              gross_rent_amount: 123,
              rooms: 2,
              floor: 23,
              total_floors: 42,
              features: ["document_scanning", "correspondence_service", "conference_hall_access"],
              furnishings: ["fireprotectionsystem", "airconditioning", "alarm system"],
              availability_date: '2023-09-26',
              polish_description: 'Description in Polish.',
              english_description: 'Description in English.',
              add_promotion: false,
            }
          end
  
          it 'responds with :created (201) status' do
            create_listing_as_visitor
            expect(response.status).to eq(201)
          end

          it'responds with verificationToken including userId & 4-digit verificationCode' do
            create_listing_as_visitor

            verificationToken = body[:verificationToken]
            decodedVerificationToken = ::Ciphers::Jwt::Decoder.new(verificationToken).call.to_h

            userId = ::MapawynajmuPl::User.find_by(email: email).id
            verificationCode = decodedVerificationToken[:verificationCode]

            expect(decodedVerificationToken).to include(
              userId: userId,
              verificationCode: verificationCode,
            )
            expect(verificationCode).to match(/^\d{4}$/)
          end

          it 'creates a new unverified listing' do
            expect { create_listing_as_visitor }.to change { ::MapawynajmuPl::Listing.count }.by(1)
          end

          it 'creates a new unverified user' do
            expect { create_listing_as_visitor }.to change { ::MapawynajmuPl::User.count }.by(1)
          end
        end
      end
    end
  end
end
