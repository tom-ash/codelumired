# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Users
          module Edit
            class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
              include ::SkillfindTech::Api::Tracks::User::Users::Edit::Meta
              include ::SkillfindTech::Api::Tracks::Posting::Common::Industries
              include ::SkillfindTech::Api::Tracks::User::New::Form::State::Inputs

              def authorize!
                raise ::Api::UnauthorizedError unless authenticated_user.present?
              end

              def localizations
                @localizations ||= user_localizations.merge(getTexts("sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/user/users/edit/localizations/#{lang}.json"))
              end

              def user_localizations
                @user_localizations ||= getTexts("sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/user/new/form/localizations/#{lang}.json")
              end

              def texts
                localizations#.merge(user_form_texts)
              end

              def inputs
                {
                  logo: authenticated_user.logo,
                  businessName: authenticated_user.business_name,
                  industry: authenticated_user.industry,
                  industrySelectOptions: industrySelectOptions,
                  emailAddress: authenticated_user.email,
                }
              end

              def asset_names
                header_asset_names + ['userCog']
              end
            end
          end
        end
      end
    end
  end
end
