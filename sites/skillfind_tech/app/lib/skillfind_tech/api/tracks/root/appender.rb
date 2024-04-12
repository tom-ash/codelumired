# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Root
        class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
          include ::SkillfindTech::Api::Tracks::Root::Meta

          private

          def texts
            {
              en: {
                skillsHeading: 'Hone your tech skills',
                featuredArticlesHeading: 'Featured Articles',
              },
              pl: {
                skillsHeading: 'Szlifuj swoje umiejętności tech',
                featuredArticlesHeading: 'Artykuły',
              },
            }[lang]
          end

          def data
            {
              postings: postings,
              pages: pages,
              articles: articles,
            }
          end

          def industries
            @industries = JSON.parse(File.read('sites/skillfind_tech/fixtures/industries.json'))
          end

          def getIndustry(value)
            industries.find do |i|
              i['value'] == value
            end
          end

          def inputs
            {
              skillOptions: skillOptions,
              selectedSkills: selectedSkills,
            }
          end

          def selectedSkills
            selectedSkillsArray = []

            params.each do |param|
              paramName = param[0]
              level = param[1]
              
              selected_skill = skillOptions.find do |skillOption|
                skillOption[:url] == paramName
              end

              if selected_skill.present?
                selectedSkillsArray << selected_skill.merge(level: level)
              end
            end

            selectedSkillsArray
          end

          def skillOptions
            @skillOptions ||= skills.map do |skill|
              {
                value: skill['name'],
                text: skill['name'],
                url: skill['url'],
              }
            end
          end

          def skills
            @skills ||= JSON.parse(File.read('sites/skillfind_tech/fixtures/skills.json'))
          end


          def queriedSkills
            @queriedSkills ||= begin
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
            if queriedSkills
              postings = ::SkillfindTech::Posting.where(id: queriedSkills.map(&:posting_id))
            else
              postings = ::SkillfindTech::Posting
            end

            postings.includes(:skills).includes(:user).map do |posting|
              {
                logo: posting.user.logo,
                businessName: posting.user.business_name,
                industry: getIndustry(posting.user.industry)[lang.to_s],
                id: posting.id,
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

          def control
            {
              isPinsDrawn: false,
              mapOptions: {
                center: {
                  lat: 52,
                  lng: 19,
                },
                zoom: 6.7,
              },
            }
          end

          def asset_names
            @asset_names ||= %i[
              chevron
              facebook_square
              linkedin_square
              twitter_square
              home
              collegeCap
              flaskVial
            ]
          end

          def page
            ::SkillfindTech::Page.find_by(url: "root/#{lang}")
          end

          def pages
            ::SkillfindTech::Page
            .includes(:category)
            .where(
              online: true,
              lang: lang,
              content_type: 'page_index',
            )
            .order('priority ASC').map do |page|
              # TODO: This is O(n²) complexity. Investigate better solution.
              page_count = ::SkillfindTech::Page.where(lang: lang, category_id: page.category_id, content_type: 'tutorial').count
              question_count = ::SkillfindTech::Question.where(lang: lang, category_id: page.category_id).count

              {
                href: "/#{page.url}",
                hrefLang: page.lang,
                title: page.title,
                description: page.category ? page.category["description_#{lang}"] : nil,
                page_count: page_count,
                question_count: question_count,
                image: page.category.image,
              }
            end
          end

          def articles
            # TODO: Change map to select.
            ::SkillfindTech::Page
            .where(
              online: true,
              lang: lang,
              content_type: 'article',
            )
            .map do |article|
              {
                href: "/#{article.url}",
                hrefLang: article.lang,
                title: article.title,
                image: article.cover_image,
                description: article.description,
              }
            end
          end
        end
      end
    end
  end
end
