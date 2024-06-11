# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Common
          module Skills
            private

            def selectableSkills
              skills.map do |skill|
                if selectedSkillNames.exclude?(skill['name'])
                  {
                    value: skill['name'],
                    text: skill['name'],
                    url: skill['url'],
                  }
                end
              end.compact
            end

            def selectedSkillNames
              @selectedSkillNames ||= selectedSkills.map do |skill|
                skill['name']
              end
            end

            def selectedSkills
              @selectedSkills ||= begin
                selectedSkillsArray = []

                params.each do |param|
                  paramName = param[0]
                  level = param[1]
                  
                  selected_skill = skills.find do |skillOption|
                    skillOption['url'].downcase == paramName.downcase
                  end

                  if selected_skill.present?
                    selectedSkillsArray << selected_skill.merge(
                      name: selected_skill['name'],
                      text: selected_skill['name'],
                      level: level,
                      value: selected_skill['name'],
                    )
                  end
                end

                selectedSkillsArray
              end
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
