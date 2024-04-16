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

                EMPTY_TEXT = ''

                def user_form_inputs
                  {
                    businessName: EMPTY_TEXT,
                    industry: 'software_house',
                    industrySelectOptions: industrySelectOptions,
                    emailAddress: EMPTY_TEXT,
                    password: EMPTY_TEXT,
                    termsOfServiceConsent: false,
                  }
                end

                def industrySelectOptions
                  industries = JSON.parse(File.read('sites/skillfind_tech/fixtures/industries.json'))
  
                  @industrySelectOptions ||= industries.map do |industry|
                    {
                      value: industry['value'],
                      text: industry[lang.to_s]
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
end
