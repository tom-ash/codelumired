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
              include ::SkillfindTech::Api::Tracks::Posting::Common::Industries
              include ::SkillfindTech::Api::Tracks::Posting::Common::CooperationMode

              EMPTY_TEXT = ''

              def localizations
                @localizations ||= user_localizations.merge(getTexts("sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/posting/create/form/localizations/#{lang}.json"))
              end

              def user_localizations
                @user_localizations ||= getTexts("sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/user/new/form/localizations/#{lang}.json")
              end

              def texts
                localizations.merge(user_form_texts)
              end
              
              def data
                {
                  industries: localizedIndustries,
                  cooperationModes: localizedCooperationModes,
                }
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
                  description: EMPTY_TEXT,
                  b2b: false,
                  b2bMin: EMPTY_TEXT,
                  b2bMax: EMPTY_TEXT,
                  employment: false,
                  employmentMin: EMPTY_TEXT,
                  employmentMax: EMPTY_TEXT,
                  cooperationMode: 'office',
                  cooperationModeRadio: {
                    name: 'cooperation_mode',
                    options: localizations[:cooperationModeOptions]
                  },
                  contracts: contracts,
                  backgroundColor: '#424949',
                  textColor: '#FBFCFC',

                  formApplicationManner: false,
                  linkApplicationManner: false,
                  applicationLink: EMPTY_TEXT,

                }.merge(user_form_inputs)
              end

              def contracts
                @contracts ||= localizations[:contracts]
              end

              def errors
                {
                  businessNameError: EMPTY_TEXT,
                  applicationLink: EMPTY_TEXT,
                }.merge(user_form_errors)
              end

              def selectableSkills
                @selectableSkills ||= ::SkillfindTech::Skill.all
              end

              def asset_names
                @asset_names ||= %i[
                  minus
                  chevron
                  camera
                  close
                  rotate
                  marker
                  coins
                  plus
                  office
                  building
                  treeCity
                  magnifyingGlass
                  arrowRight
                ] + header_asset_names + industryIcons
              end
            end
          end
        end
      end
    end
  end
end
