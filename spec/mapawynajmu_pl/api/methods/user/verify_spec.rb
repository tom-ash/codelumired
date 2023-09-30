# frozen_string_literal: true

require 'mapawynajmu_pl/rails_helper.rb'

RSpec.describe ::Api::User::Create::EmailAndPassword do
  let(:verify_user) do
    put '/mapawynajmu-pl/user/create/email-and-password', headers: headers, params: params
  end
  let(:headers) do
    {
      'Lang': 'pl',
    }
  end
  let(:params) do
    {
      verification_token: verificationToken,
      verification_code: verificationCode,
    }
  end

  let(:user) { create(:mapawynajmu_pl_user, email_verified_at: nil) }
  let(:verificationToken) do
    ::Ciphers::Jwt::Encoder.new(
      userId: user.id,
      verificationCode: '4242',
    ).call
  end
  let(:body) { JSON.parse(response.body).deep_symbolize_keys }

  describe '/mapawynajmu-pl/user/create/email-and-password' do
    describe 'verification code' do
      context 'when verification code is valid' do
        let(:verificationCode) { '4242' }

        it 'responds with :ok (201) status' do
          verify_user
          expect(response.status).to eq(200)
        end

        it 'marks the user as verified' do
          expect { verify_user }.to change { user.reload.email_verified_at }.from(nil).to(kind_of(Time))
        end

        it 'responds with an access token' do
          verify_user

          expect(body[:accessToken]).to match(/^ey/)
        end

        context 'when the user has no listing' do
          it 'responds with listing confirmation href' do
            verify_user

            expect(body[:href]).to eq("http://local.mapawynajmu.pl:8080/potwierdzenie-utworzenia-konta/#{user.id}")
          end
        end

        context 'when the user has a listing' do
          let!(:listing) { create(:mapawynajmu_pl_listing, user: user, user_verified: false) }
          let(:mail_message) { instance_double(ActionMailer::MessageDelivery, deliver_now: true) }

          before do
            allow(TransactionalMailer).to receive(:listing_confirmation_email).and_return(mail_message)
          end

          it 'marks the listing as verified' do
            expect { verify_user }.to change { listing.reload.user_verified }.from(false).to(true)
          end

          it 'sends listing confirmation email' do
            expect(TransactionalMailer).to receive(:listing_confirmation_email)
            expect(mail_message).to receive(:deliver_now)

            verify_user
          end

          context 'when the listing is not promoted' do
            it 'responds with listing confirmation href' do
              verify_user
  
              expect(body[:href]).to eq("http://local.mapawynajmu.pl:8080/podsumowanie-dodanego-ogloszenia/#{listing.id}")
            end
          end

          context 'when the listing is promoted' do
            let!(:listing) { create(:mapawynajmu_pl_listing, user: user, user_verified: false, is_promoted: true) }

            it 'responds with payment href' do
              verify_user
  
              expect(body[:href]).to match(/^https:\/\/merch-prod.snd.payu.com\/pay\/\?orderId=/)
            end

            it 'creates an order with status PENDING' do
              expect { verify_user }.to change { ::MapawynajmuPl::Order.count }.by(1)
            end
          end
        end

        context 'when the user is already verified' do
          let(:user) { create(:mapawynajmu_pl_user, email_verified_at: Time.now) }

          it 'responds with :unprocessable_entity (422) status' do
            verify_user
            expect(response.status).to eq(422)
          end
        end
      end

      context 'when verification code is invalid' do
        let(:verificationCode) { '2323' }

        it 'responds with :unprocessable_entity (422) status' do
          verify_user
          expect(response.status).to eq(422)
        end
      end
    end
  end
end
