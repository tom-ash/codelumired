# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Appender
          include ::Api::Tracks::Helpers::Appender
          include ::MapawynajmuPl::Api::Tracks::Root::Meta
          include ::MapawynajmuPl::Api::Tracks::Helpers::Announcements
          include ::MapawynajmuPl::Api::Tracks::Helpers::Filters

          private

          def merge_state
            state.merge!(
              'announcement/index/data': data,
              'announcement/index/inputs': inputs,
              'page/index': {
                articles: articles
              }
            )
          end

          def data
            {
              announcements: serialized_announcements,
              amount: serialized_announcements.count,
              current_category: category
            }
          end

          def page_name
            @page_name ||= begin
              return unless url.in?(['/', 'en'])

              'root'
            end
          end

          def articles
            ::MapawynajmuPl::Page.where(category: 'articles', lang: lang).map do |page|
              {
                title: page.title,
                description: page.description,
                category: page.category,
                subcategory: page.subcategory,
                hrefLang: page.lang,
                pathname: page.url,
                modifiedOn: page.modified_on,
                logo: page.link_data['logo'],
                image: page.link_data['image']
              }
            end
          end
        end
      end
    end
  end
end
