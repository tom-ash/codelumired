# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Common
          module Postings
            private

            def selectedPostingIds
              @selectedPostingIds ||= begin
                if (selectedSkills.length > 0)
                  whereArray = []
                  whereDataArray = []
                  whereString = nil
                  arr = nil
                  
                  selectedSkills.map do |selectedSkill|
                    whereArray << "(name = ? AND level <= ?)"
                    whereString = whereArray.join(' OR ')
                    whereDataArray << selectedSkill[:value]
                    whereDataArray << (selectedSkill[:level] == '0' ? '5' : selectedSkill[:level])
  
                    arr = [whereString] + whereDataArray
                  end
  
                  return ::SkillfindTech::SelectedSkill.joins(:skill)
                    .where(*arr)
                    .group(:posting_id).having("count(posting_id) = #{selectedSkills.length}")
                    .select(:posting_id)
                end
              end
            end
  
            def postings
              if selectedPostingIds
                postings = ::SkillfindTech::Posting.where(id: selectedPostingIds.map(&:posting_id))
              else
                postings = ::SkillfindTech::Posting
              end
  
              postings.includes(:skills).includes(:user).map do |posting|
                {
                  logo: posting.user.logo,
                  businessName: posting.user.business_name,
                  industry: getIndustry(posting.user.industry)[lang.to_s],
                  id: posting.id,
                  href: "/#{posting.id}-TODO",
                  skills: postingSelectedSkills(posting),
                  b2b: posting.b2b,
                  b2bMin: posting.b2b_min,
                  b2bMax: posting.b2b_max,
                  employment: posting.employment,
                  employmentMin: posting.employment_min,
                  employmentMax: posting.employment_max,
                  country: posting.country,
                  locality: posting.locality,
                  sublocality: posting.sublocality,
                  cooperationMode: posting.cooperation_mode,
                  lat: posting.lat,
                  lng: posting.lng,
                }
              end
            end
  
            def postingSelectedSkills(posting)
              posting.selected_skills.map do |selected_skill|
                {
                  name: selected_skill.skill.name,
                  level: selected_skill.level,
                }
              end
            end
          end
        end
      end
    end
  end
end
