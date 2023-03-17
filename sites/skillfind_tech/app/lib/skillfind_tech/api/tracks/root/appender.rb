# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Root
        class Appender < ::SkillfindTech::Api::Tracks::Common::Appender
          include ::SkillfindTech::Api::Tracks::Root::Meta

          private

          def data
            {
              postings: postings,
              tutorials: tutorials,
              articles: articles,
            }.merge(
              ::Serializers::Page::Show.new(page: page, constantized_site_name: constantized_site_name).call,
            )
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

          def tutorials
            ::SkillfindTech::Page.where(category: %w[tutorials insights]).map do |page|
              {
                title: page.title,
                description: page.description,
                category: page.category,
                subcategory: page.subcategory,
                hrefLang: page.lang,
                pathname: page.url,
                modifiedOn: page.modified_on,
                image: page.cover_image,
              }
            end
          end

          def articles
            ::SkillfindTech::Page.where(category: 'articles').map do |page|
              {
                title: page.title,
                description: page.description,
                category: page.category,
                subcategory: page.subcategory,
                hrefLang: page.lang,
                pathname: page.url,
                modifiedOn: page.modified_on,
                image: page.cover_image,
              }
            end
          end
        end
      end
    end
  end
end
