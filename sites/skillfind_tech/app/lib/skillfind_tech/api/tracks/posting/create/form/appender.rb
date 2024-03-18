# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Create
          module Form
            class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
              include ::SkillfindTech::Api::Tracks::Posting::Create::Form::State
              include ::SkillfindTech::Api::Tracks::Posting::Create::Form::Meta

              EMPTY_TEXT = ''

              def texts
                {
                  en: {
                    businessNameInputLabel: 'Business Name',
                    industrySelectLabel: 'Industry PL',
                  },
                  pl: {
                    businessNameInputLabel: 'Nazwa ogłoszeniodawcy',
                    industrySelectLabel: 'Industry',
                  },
                }[lang]
              end

              # def control
              #   {
              #     mapOptions: {
              #       center: {
              #         lat: 52,
              #         lng: 19,
              #       },
              #       zoom: 6.7,
              #     },
              #   }
              # end

              def inputs
                {
                  businessName: EMPTY_TEXT,
                  selectableSkills: selectableSkills,
                  selectedSkills: [],
                  b2b: false,
                  b2bMin: EMPTY_TEXT,
                  b2bMax: EMPTY_TEXT,
                  industry: 'moto',
                  industrySelectOptions: industrySelectOptions,
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

              def errors
                {
                  businessNameError: '',
                }
              end

              def selectableSkills
                @selectableSkills ||= ::SkillfindTech::Skill.all
              end

              #   const initialState = {
              #   selectableSkills: [],
              #   selectedSkills: [],
              #   companyName: '',
              #   companyIndustry: '',
              #   companyDescription: '',
              #   companyOfficeCity: '',
              #   b2b: false,
              #   b2bMin: null,
              #   b2bMax: null,
              #   civilContract: false,
              #   civilContractMin: null,
              #   civilContractMax: null,
              #   employment: false,
              #   employmentMin: null,
              #   employmentMax: null,
              #   description: null,
              #   applicationEmail: null,
              #   applicationLink: null,
              #   cooperationMode: null,
              #   remote: false,
              #   hybrid: false,
              #   office: false,
              # }
            end
          end
        end
      end
    end
  end
end
