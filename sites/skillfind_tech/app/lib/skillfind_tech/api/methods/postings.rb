# frozen_string_literal: true

module SkillfindTech
  module Api
    module Methods
      class Postings < Grape::API
        namespace do
          before { authorize! }

          params do
            requires :selected_skills, type: Array
            requires :cooperation_mode, type: String
            requires :lat, type: Float
            requires :lng, type: Float
            requires :place_id, type: String
            requires :place_autocomplete, type: String
            optional :country, type: String
            optional :locality, type: String
            optional :sublocality, type: String
            optional :pl_description, type: String
            optional :en_description, type: String
            requires :b2b, type: Boolean
            optional :b2b_min, type: Integer
            optional :b2b_max, type: Integer
            requires :employment, type: Boolean
            optional :employment_min, type: Integer
            optional :employment_max, type: Integer
            requires :background_color
            requires :text_color
            requires :image

            requires :form_application_manner, type: Boolean
            requires :link_application_manner, type: Boolean
            optional :application_link, type: String
          end
          post do
            posting = ::SkillfindTech::Commands::Posting::Create.new(
              user_id: authenticated_user.id,
              attrs: params,
            ).call

            posting.verified = true
            posting.save!

            ::SkillfindTech::Mailers::Postings::Confirmation::Sender.prepare(
              to: authenticated_user.email,
              posting_id: posting.id,
              lang: lang.to_sym,
            ).deliver_now

            # TODO: Redirect to postings/show.
            ::SkillfindTech::Api::Tracks::Root::Linker.new(lang).call
          end

          params do
            requires :posting_id, type: Integer
            requires :selected_skills, type: Array
            requires :cooperation_mode, type: String
            requires :lat, type: Float
            requires :lng, type: Float
            requires :place_id, type: String
            requires :place_autocomplete, type: String
            optional :country, type: String
            optional :locality, type: String
            optional :sublocality, type: String
            optional :pl_description, type: String
            optional :en_description, type: String
            requires :b2b, type: Boolean
            optional :b2b_min, type: Integer
            optional :b2b_max, type: Integer
            requires :employment, type: Boolean
            optional :employment_min, type: Integer
            optional :employment_max, type: Integer
            requires :background_color
            requires :text_color

            requires :form_application_manner, type: Boolean
            requires :link_application_manner, type: Boolean
            optional :application_link, type: String
          end
          put do
            ::SkillfindTech::Commands::Posting::Update.new(
              user_id: authenticated_user.id,
              attrs: params,
            ).call

            ::SkillfindTech::Api::Tracks::Root::Linker.new(headers['Lang']).call[:href]
          end

          delete ':posting_id' do
            posting = ::SkillfindTech::Posting.find_by!(
              id: params[:posting_id],
              user_id: authenticated_user.id
            )

            posting.update!(
              deleted_at: Time.now
            )
          end
        end

        params do
          requires :selected_skills, type: Array
          requires :cooperation_mode, type: String
          requires :lat, type: Float
          requires :lng, type: Float
          requires :place_id, type: String
          requires :place_autocomplete, type: String
          optional :country, type: String
          optional :locality, type: String
          optional :sublocality, type: String
          optional :pl_description, type: String
          optional :en_description, type: String
          requires :b2b, type: Boolean
          optional :b2b_min, type: Integer
          optional :b2b_max, type: Integer
          requires :employment, type: Boolean
          optional :employment_min, type: Integer
          optional :employment_max, type: Integer
          requires :email_address, type: String
          requires :password, type: String
          requires :terms_of_service_consent, type: Boolean
          requires :consents, type: Array
          requires :logo, type: String
          requires :background_color
          requires :text_color
          requires :image

          requires :form_application_manner, type: Boolean
          requires :link_application_manner, type: Boolean
          optional :application_link, type: String
        end
        post 'users' do
          user ||= site::User.find_or_initialize_by(email: params[:email_address])

          error!('users.email_already_registered', 422) if user.verified?
          
          user.business_name = params[:business_name]
          user.industry = params[:industry]
          user.logo = params[:logo]
          user.change_log = []

          # TODO: Consents!
          # ::Parsers::User::Consents.new(user: user, consents: params[:consents]).call
          ::Ciphers::User::HashPassword.new(user: user, password: params[:password]).call

          user.save!

          ::SkillfindTech::Commands::Posting::Create.new(
            user_id: user.id,
            attrs: params,
          ).call

          verificationCode = rand(1000..9999).to_s

          ::SkillfindTech::Mailers::Poster::Verification::Account::Sender.prepare(
            to: params[:email_address],
            verification_code: verificationCode,
            lang: lang,
          ).deliver_now

          decodedVerificationToken = {
            verificationCode: verificationCode,
            userId: user.id,
          }
          verificationToken = ::Ciphers::Jwt::Encoder.new(decodedVerificationToken).call
          href = ::SkillfindTech::Api::Tracks::User::New::Verify::Linker.new(lang, id: user.id).call[:href]

          {
            href: href,
            verificationToken: verificationToken,
          }
        end
      end
    end
  end
end
  