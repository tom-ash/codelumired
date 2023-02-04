# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Confirmation
            module Texts
              private

              def texts
                {
                  h1: h1,
                  congratulations: congratulations,
                  account_created: account_created,
                  partner_page: partner_page,
                }
              end

              def h1
                {
                  pl: 'Potwierdzenie utworzenia konta',
                  en: 'Account Creation Confirmation',
                }[lang]
              end

              def congratulations
                {
                  pl: 'Gratulacje!',
                  en: 'Congratulations!',
                }[lang]
              end

              def account_created
                {
                  pl: 'Twoje konto zostało utworzone pomyślnie!',
                  en: 'Your account has been created successfully!',
                }[lang]
              end

              def partner_page
                {
                  pl: 'Strona partnerska',
                  en: 'Partner page of ',
                }[lang]
              end
            end
          end
        end
      end
    end
  end
end
