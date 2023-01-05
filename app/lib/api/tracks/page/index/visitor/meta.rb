# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Index
        module Visitor
          module Meta
            TRACK = 'page/index/visitor'

            UNLOCALIZED_PATH = {
              pl: 'artykuly-o-wynajmie-nieruchomosci',
              en: 'articles-on-real-estate-leasing'
            }.freeze

            UNLOCALIZED_TITLE = {
              pl: 'Artykuły o wynajmie nieruchomości',
              en: 'Articles on Real Estate Leasing'
            }.freeze

            private

            def track
              @track ||= TRACK
            end

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              # TODO: SEO.
              @unlocalized_keywords ||= {
                pl: 'strony',
                en: 'pages',
              }.freeze
            end

            def unlocalized_description
              # TODO: SEO.
              @unlocalized_description ||= {
                pl: 'Artykuły o wynajmie nieruchomości.',
                en: 'Articles on Real Estate Leasing.',
              }.freeze
            end

            def render
              {
                visitor: true,
                page: true,
                'page/show': true,
              }
            end

            def links
              {
                'current/pl': ::Api::Tracks::Page::Index::Visitor::Linker.new(:pl).call,
                'current/en': ::Api::Tracks::Page::Index::Visitor::Linker.new(:en).call,
              }
            end
          end
        end
      end
    end
  end
end
