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

          def postings
            ::SkillfindTech::Posting.includes(:selected_skills).map do |posting|
              {
                id: posting.id,
                industry: getIndustry(posting.industry)[lang.to_s],
                skills: ::SkillfindTech::SelectedSkill.joins(:skill).where(posting_id: posting.id).select(:level, :name), # TODO!!!
                b2b: posting.b2b,
                b2bMin: posting.b2b_min,
                b2bMax: posting.b2b_max,

                lat: posting.lat,
                lng: posting.lng,
                
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
