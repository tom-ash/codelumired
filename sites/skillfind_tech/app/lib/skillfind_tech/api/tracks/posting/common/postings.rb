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

              if postings_user_id
                postings = postings.where(user_id: postings_user_id)
              end
  
              postings
              .includes(:skills)
              .includes(:user)
              .where(deleted_at: nil)
              .where(verified: true)
              .order('active_until DESC NULLS LAST')
              .map do |posting|
                industry = getIndustry(posting.user.industry)

                {
                  logo: "https://#{ENV['SKILLFIND_TECH_AWS_S3_BUCKET']}.s3.eu-central-1.amazonaws.com/logos/#{posting.user.logo}",
                  businessName: posting.user.business_name,
                  industry: industry[lang.to_s],
                  industryIcon: industry['icon'],
                  id: posting.id,
                  href: posting_href(posting, lang),
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
                  cooperationMode: localizedCooperationMode(posting.cooperation_mode),
                  lat: posting.lat,
                  lng: posting.lng,
                  backgroundColor: posting.background_color,
                  textColor: posting.text_color,
                  active_until: posting.active_until,
                }
              end
            end

            def posting_href(posting, lang)
              "#{posting_prefix(lang)}/#{posting.id}#{path_suffix(posting, lang)}"
            end

            def posting_prefix(lang)
              lang != :en ? "/#{lang}" : ''
            end

            def path_suffix(posting, lang)
              path_suffix_string = ''

              postingSelectedSkills(posting).map do |skill|
                path_suffix_string = path_suffix_string + "-#{skill[:name].parameterize}-#{skill_levels[skill[:level] - 1][lang]}"
              end

              path_suffix_string.downcase
            end

            def skill_levels
              [
                { en: 'Novice', pl: 'Nowicjusz' },
                { en: 'Junior', pl: 'Junior' },
                { en: 'Mid', pl: 'Mid' },
                { en: 'Senior', pl: 'Senior' },
                { en: 'Expert', pl: 'Ekspert' },
              ]
            end
  
            def postingSelectedSkills(posting)
              posting.selected_skills.map do |selected_skill|
                {
                  name: selected_skill.skill.name,
                  level: selected_skill.level,
                }
              end
            end

            def localizedCooperationMode(cooperationMode)
              localizedCooperationModes.find do |mode|
                mode[:value] == cooperationMode
              end
            end

            def localizedCooperationModes
              @localizedCooperationModes ||= getTexts("sites/skillfind_tech/app/lib/skillfind_tech/api/tracks/posting/common/localizations/cooperation-modes/#{lang}.json")[:cooperationModes]
            end

            def postings_user_id
              nil
            end
          end
        end
      end
    end
  end
end
