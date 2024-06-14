# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module New
          module Form
            module State
              module Texts
                private

                def user_form_texts
                  localizations.merge(
                    termsOfServiceConsentLabel: termsOfServiceConsentLabel,
                    termsOfServiceConsentSyntheticLabel: termsOfServiceConsentSyntheticLabel,
                    termsOfService: termsOfService,
                  )
                end

                def termsOfServiceConsentLabel
                  @termsOfServiceConsentLabel ||= termsOfServiceConsentSyntheticLabel.gsub('{termsOfService}', termsOfService)
                end

                def termsOfServiceConsentSyntheticLabel
                  @termsOfServiceConsentSyntheticLabel ||= {
                    pl: 'Oświadczam, że znam i akceptuję postanowienia {termsOfService}.',
                    en: 'I declare that I know and accept {termsOfService}.',
                  }[lang]
                end

                def termsOfService
                  @termsOfService ||= {
                    pl: 'Regulaminu skillfind.tech',
                    en: 'the Terms of Service of skillfind.tech',
                  }[lang]
                end
              end
            end
          end
        end
      end
    end
  end
end
