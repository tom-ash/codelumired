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
              pl: {
                honeYourSkillsHeadingTwo: 'Szlifuj swoje umiejętności tech',
              },
              en: {
                honeYourSkillsHeadingTwo: 'Hone your tech skills',
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

          def postings
            ::SkillfindTech::Posting.includes(:coveted_skills).map do |job|
              {
                id: job.id,
                skills: job.selected_skills,
                b2b: job.b2b,
                b2bMin: job.b2b_min,
                b2bMax: job.b2b_max,
              }
            end
          end

          def page
            ::SkillfindTech::Page.find_by(url: "root/#{lang}")
          end

          def pages
            # TODO: Change map to select.
            ::SkillfindTech::Page.where(
              category: 'skill',
              online: true,
              lang: lang,
            ).map do |page|
              {
                title: page.title,
                href: page.url,
                hrefLang: page.lang,
              }
            end
          end

          def articles
            # TODO: Change map to select.
            ::SkillfindTech::Page.where(
              category: 'article',
              online: true,
              lang: lang,
            ).map do |article|
              {
                title: article.title,
                href: article.url,
                hrefLang: article.lang,
                image: article.cover_image,
              }
            end
          end
        end
      end
    end
  end
end
