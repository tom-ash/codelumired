# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Form
            module State
              module Inputs
                private

                def user_form_inputs
                  {
                    logo: authenticated_user.present? ? "https://#{ENV['SKILLFIND_TECH_AWS_S3_BUCKET']}.s3.eu-central-1.amazonaws.com/logos/#{authenticated_user&.logo}" : EMPTY_STRING,
                    link: HTTPS_PROTOCOL_PREFIX,
                    businessName: authenticated_user&.business_name || EMPTY_STRING,
                    industry: authenticated_user&.industry || 'software_house',
                    industrySelectOptions: industrySelectOptions,
                    emailAddress: EMPTY_STRING,
                    password: EMPTY_STRING,
                    termsOfServiceConsent: false,
                  }
                end
              end
            end
          end
        end
      end
    end
  end
end
