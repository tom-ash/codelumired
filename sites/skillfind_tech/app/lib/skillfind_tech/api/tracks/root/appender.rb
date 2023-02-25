# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Root
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::SkillfindTech::Api::Tracks::Root::Meta

          private

          def data
            {
              tutorials: tutorials,
              articles: articles,
            }.merge(
              ::Serializers::Page::Show.new(page: page, constantized_site_name: constantized_site_name).call,
            )
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
