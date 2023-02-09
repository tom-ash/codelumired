# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Index
        module Visitor
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::Api::Tracks::Page::Index::Visitor::Meta

            private

            def data
              # TODO: Refactor!
              ::Serializers::Page::Show.new(
                page: page,
                constantized_site_name: constantized_site_name,
              ).call.merge(
                articles: articles,
              )
            end

            def page
              site::Page.find_by(url: "index/visitor/#{lang}")
            end

            def articles
              site::Page.where(category: 'articles', lang: lang).map do |page|
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
end
