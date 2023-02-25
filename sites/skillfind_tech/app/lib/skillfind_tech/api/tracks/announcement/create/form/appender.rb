# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::SkillfindTech::Api::Tracks::Announcement::Create::Form::Meta

              def inputs
                {
                  selectableSkills: selectableSkills,
                  selectedSkills: [],
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

            # export default initialState

              # TODO!
            end
          end
        end
      end
    end
  end
end
