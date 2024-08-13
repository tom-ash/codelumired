# frozen_string_literal: true

module SkillfindTech
  module Mailers
    module Poster
      module Verification
        module Password
          class Sender < ::SkillfindTech::Mailers::Poster::Verification::Base::Sender
            def prepare(to:, verification_code:, lang:)
              super

              @verification_code = verification_code

              mail(
                from: "#{SKILLFIND_TECH_NAME} <noreply@#{SKILLFIND_TECH_APEX_DOMAIN}>",
                to: @to,
                subject: subject,
                template_path: 'notifications',
                template_name: 'create',
              )
            end

            private

            def verification_code_message
              localizations[:verification_code_message]
            end

            def subject
              localizations[:subject]
            end

            def localizations
              @localizations ||= super.merge(getLocalizations("sites/skillfind_tech/app/lib/skillfind_tech/mailers/poster/verification/password/localizations/#{lang}.json"))
            end
          end
        end
      end
    end
  end
end
