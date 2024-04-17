# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Root
        class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
          include ::SkillfindTech::Api::Tracks::Root::Meta
          include ::SkillfindTech::Api::Tracks::Posting::Common::Skills
          include ::SkillfindTech::Api::Tracks::Posting::Common::Postings
          include ::SkillfindTech::Api::Tracks::Posting::Common::Industries

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

          def inputs
            {
              skillOptions: skillOptions,
              selectedSkills: selectedSkills,
            }
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
              marker
              office
              building
              earthGlobe
              treeCity
            ]
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
