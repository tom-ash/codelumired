# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Postings
          module Edit
            class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
              include ::SkillfindTech::Api::Tracks::User::Postings::Edit::Meta
              include ::SkillfindTech::Api::Tracks::Posting::Common::Postings

              EMPTY_TEXT = ''

              def localizations
                @localizations ||= getTexts("sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/posting/create/form/localizations/#{lang}.json")
              end

              def texts
                localizations
              end

              def data
                {
                  postingId: postingId,
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

              def match_data
                @match_data ||= unlocalized_path[lang].match(url)
              end

              def inputs
                {
                  selectableSkills: selectableSkills,
                  selectedSkills: selectedSkills,
                  cooperationMode: posting.cooperation_mode,
                  cooperationModeRadio: {
                    name: 'cooperation_mode',
                    options: localizations[:cooperationModeOptions]
                  },
                  placeId: posting.place_id,
                  latitude: posting.lat,
                  lat: posting.lat,
                  longitude: posting.lng,
                  lng: posting.lng,
                  placeAutocomplete: posting.place_autocomplete,
                  location: posting.place_autocomplete,
                  country: posting.country,
                  locality: posting.locality,
                  sublocality: posting.sublocality,
                  street: posting.street,
                  addEnDescription: posting.en_description.present?,
                  enDescription: posting.en_description,
                  addPlDescription: posting.pl_description.present?,
                  plDescription: posting.pl_description,
                  b2b: posting.b2b,
                  b2bMin: posting.b2b_min,
                  b2bMax: posting.b2b_max,
                  employment: posting.employment,
                  employmentMin: posting.employment_min,
                  employmentMax: posting.employment_max,
                  contracts: contracts,
                }
              end

              def contracts
                @contracts ||= localizations[:contracts]
              end

              def errors
                {
                  # TODO
                }
              end

              def selectedSkills
                @selectedSkills ||= postingSelectedSkills(posting)
              end

              def selectableSkills
                ::SkillfindTech::Skill.all.map do |skill|
                  if selectedSkillNames.exclude?(skill.name)
                    {
                      name: skill.name,
                    }
                  end
                end.compact
              end

              def selectedSkillNames
                selectedSkills.map do |skill|
                  skill[:name]
                end
              end

              def asset_names
                @asset_names ||= %i[minus chevron camera close rotate] + header_asset_names
              end

              def posting
                @posting ||= ::SkillfindTech::Posting.includes(:user).find(postingId)
              end

              def postingId
                @postingId ||= match_data[:posting_id]
              end
            end
          end
        end
      end
    end
  end
end
