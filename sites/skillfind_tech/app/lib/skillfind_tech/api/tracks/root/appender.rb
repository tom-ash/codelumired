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
            }
          end

          def postings
            ::SkillfindTech::Job.includes(:coveted_skills).map do |job|
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
            ::SkillfindTech::Page.where(category: 'skill', lang: lang).map do |page|
              {
                title: page.title,
                href: page.url,
                hrefLang: page.lang,
              }
            end
          end
        end
      end
    end
  end
end
