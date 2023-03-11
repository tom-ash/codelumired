# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Edit
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::User::Edit::Meta

            private

            def control
              {
                emailStage: nil,
                emailStep: 'currentEmailVerification',
                phoneStage: nil,
                destroyStage: nil,
              }
            end

            def texts
              {
                pl: {
                  headingOne: 'Ustawienia konta',
                  userDeletionTitle: 'Usuwanie konta',
                  userDeletionValue: 'Usunięcie konta jest nieodwracalne.',
                },
                en: {
                  headingOne: 'Account Settings',
                  userDeletionTitle: 'Account Deletion',
                  userDeletionValue: 'Account deletion is irreversible.',
                },
              }[lang]
            end

            def data
              ::Serializers::User::Edit.new(
                user: authenticated_user,
                constantized_site_name: constantized_site_name,
              ).call
            end

            def inputs
              {
                country_code: authenticated_user.country_code,
              }
            end
          end
        end
      end
    end
  end
end
