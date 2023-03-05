# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::SkillfindTech::Api::Tracks::Announcement::Create::Form::State
              include ::SkillfindTech::Api::Tracks::Announcement::Create::Form::Meta

              EMPTY_TEXT = ''

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
