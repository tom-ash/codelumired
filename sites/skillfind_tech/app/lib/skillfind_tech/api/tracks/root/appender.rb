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

          def postings
            ::SkillfindTech::Posting.includes(:selected_skills).map do |posting|
              {
                id: posting.id,
                skills: ::SkillfindTech::SelectedSkill.joins(:skill).where(posting_id: posting.id).select(:level, :name), # TODO!!!
                b2b: posting.b2b,
                b2bMin: posting.b2b_min,
                b2bMax: posting.b2b_max,
              }
            end
          end

          def page
            ::SkillfindTech::Page.find_by(url: "root/#{lang}")
          end

          def pages
            # TODO: Change map to select.
            ::SkillfindTech::Page
            .includes(:category)
            .where(
              online: true,
              lang: lang,
              content_type: 'page_index',
            )
            .order('priority ASC').map do |page|
              # byebug
              {
                href: "/#{page.url}",
                hrefLang: page.lang,
                title: page.title,
                description: page.category ? page.category["description_#{lang}"] : nil,
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
