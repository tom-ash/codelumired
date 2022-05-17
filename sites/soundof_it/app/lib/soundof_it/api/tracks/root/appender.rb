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
                tutorials: tutorials
              }
            )
          end

          def page_name
            @page_name ||= 'root'
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
