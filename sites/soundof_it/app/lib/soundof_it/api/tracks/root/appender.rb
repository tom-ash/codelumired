# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Root
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::SoundofIt::Api::Tracks::Root::Meta

          private

          def merge_state
            state.merge!(
              'page/index': {
                tutorials: tutorials,
                articles: articles
              }
            )
          end

          def accessory_page
            @accessory_page ||= "root/#{lang}"
          end

          def tutorials
            ::SoundofIt::Page.where(category: ['tutorials', 'insights']).map do |page|
              {
                title: page.title,
                description: page.description,
                category: page.category,
                subcategory: page.subcategory,
                hrefLang: page.lang,
                pathname: page.url,
                modifiedOn: page.modified_on,
                image: page.cover_image
              }
            end
          end

          def articles
            ::SoundofIt::Page.where(category: 'articles').map do |page|
              {
                title: page.title,
                description: page.description,
                category: page.category,
                subcategory: page.subcategory,
                hrefLang: page.lang,
                pathname: page.url,
                modifiedOn: page.modified_on,
                image: page.cover_image
              }
            end
          end
        end
      end
    end
  end
end
