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

              def localizations
                @localizations ||= getTexts("sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/posting/create/form/localizations/#{lang}.json")
              end

              def texts
                localizations
              end

              def control
                {
                  mapOptions: {
                    center: {
                      lat: 52,
                      lng: 19,
                    },
                    zoom: 6.7,
                  },
                }
              end

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
                  cooperationMode: 'office',
                  cooperationModeRadio: {
                    name: 'cooperation_mode',
                    options: localizations[:cooperationModeOptions]
                  },
                  contracts: contracts,
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

              def contracts
                @contracts ||= localizations[:contracts]
              end

              def errors
                {
                  businessNameError: '',
                }
              end

              def selectableSkills
                @selectableSkills ||= ::SkillfindTech::Skill.all
              end

              def asset_names
                ['minus']
              end
            end
          end
        end
      end
    end
  end
end
