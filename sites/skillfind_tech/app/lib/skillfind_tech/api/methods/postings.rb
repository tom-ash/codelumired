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
          end
          post do
            ::SkillfindTech::Commands::Posting::Create.new(
              user_id: authenticated_user.id,
              attrs: params,
            ).call

            ::SkillfindTech::Api::Tracks::Root::Linker.new(headers['Lang']).call[:href]
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
          end
          put do
            ::SkillfindTech::Commands::Posting::Update.new(
              user_id: authenticated_user.id,
              attrs: params,
            ).call

            ::SkillfindTech::Api::Tracks::Root::Linker.new(headers['Lang']).call[:href]
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
          requires :logo, type: Hash
        end
        post 'users' do
          user ||= site::User.find_or_initialize_by(email: params[:email_address])

          error!('users.email_already_registered', 422) if user.verified?
          
          user.business_name = params[:business_name]
          user.industry = params[:industry]
          user.logo = "#{user.business_name.parameterize}.png"
          user.change_log = []

          # TODO: Consents!
          # ::Parsers::User::Consents.new(user: user, consents: params[:consents]).call
          ::Ciphers::User::HashPassword.new(user: user, password: params[:password]).call

          # TODO!
          # temporary_logo ||= Aws::S3::Object.new(
          #   credentials: CREDS,
          #   region: Rails.application.secrets.aws_region,
          #   bucket_name: bucket,
          #   key: "temporary/#{params[:logo]}",
          # )

          user.save!

          # temporary_logo.move_to("#{bucket}/logos/#{user.logo}")

          ::SkillfindTech::Commands::Posting::Create.new(
            user_id: user.id,
            attrs: {
              selected_skills: params[:selected_skills],
              cooperation_mode: params[:cooperation_mode],
              place_id: params[:place_id],
              lat: params[:lat],
              lng: params[:lng],
              place_autocomplete: params[:place_autocomplete],
              country: params[:country],
              locality: params[:locality],
              sublocality: params[:sublocality],
              pl_description: params[:pl_description],
              en_description: params[:en_description],
              b2b: params[:b2b],
              b2b_min: params[:b2b_min],
              b2b_max: params[:b2b_max],
              employment: params[:employment],
              employment_min: params[:employment_min],
              employment_max: params[:employment_max],
            },
          ).call

          verificationCode = rand(1000..9999).to_s

          ::Mailers::Verification.new(
            email: params[:email_address],
            namespace: 'user/create/email-and-password',
            lang: lang,
            verification_code: verificationCode,
          ).send

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
  