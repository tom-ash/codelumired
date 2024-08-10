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
                # selectedSkillValues
                # byebug
                if selectedSkillValues.exclude?(skill['value'])
                  {
                    value: skill['value'],
                    display: skill[lang],
                    queryParam: skill["route_#{lang}"],
                  }
                end
              end.compact
            end

            def selectedSkillValues
              @selectedSkillValues ||= selectedSkills.map do |skill|
                skill[:value]
              end
            end

            def selectedSkills
              @selectedSkills ||= begin
                selectedSkillsArray = []

                params.each do |param|
                  queryParam = param[0]
                  level = param[1]
                  
                  selected_skill = skills.find do |skillOption|
                    skillOption["route_#{lang}"] == queryParam.gsub('_', '-')
                  end

                  if selected_skill.present?
                    selectedSkillsArray << {
                      value: selected_skill['value'],
                      display: selected_skill[lang],
                      queryParam: selected_skill["route_#{lang}"],
                      level: level,
                    }
                  end
                end

                selectedSkillsArray
              end
            end

            def skills
              @skills ||= ::SkillfindTech::Skill.all
            end
          end
        end
      end
    end
  end
end
