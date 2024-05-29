# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Common
          module Skills
            private

            def selectableSkills
              @selectableSkills ||= skills.map do |skill|
                {
                  value: skill['name'],
                  text: skill['name'],
                  url: skill['url'],
                }
              end
            end

            def selectedSkills
              selectedSkillsArray = []

              params.each do |param|
                paramName = param[0]
                level = param[1]
                
                selected_skill = selectableSkills.find do |skillOption|
                  skillOption[:url] == paramName
                end

                if selected_skill.present?
                  selectedSkillsArray << selected_skill.merge(level: level)
                end
              end

              selectedSkillsArray
            end

            def skills
              @skills ||= JSON.parse(File.read('sites/skillfind_tech/fixtures/skills.json'))
            end
          end
        end
      end
    end
  end
end
