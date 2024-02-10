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

              # Software House
              # Finance & Banking
              # E-Commerce
              # Health
              # Motorization
              # Aviation
              # Cosmonautics
              # Energetics
              # Media
              # Streaming
              # Video Games
              # Science
              # Education

              INDUSTRIES = [
                {
                  name: 'motorization',
                  pl: 'Motoryzacja',
                  en: 'Motorization',
                }
              ]

              def texts
                {
                  en: {
                    businessNameInputLabel: 'Business Name',
                  },
                  pl: {
                    businessNameInputLabel: 'Nazwa ogłoszeniodawcy',
                  },
                }[lang]
              end

              def inputs
                {
                  selectableSkills: selectableSkills,
                  selectedSkills: [],
                  b2b: false,
                  b2bMin: EMPTY_TEXT,
                  b2bMax: EMPTY_TEXT,
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
