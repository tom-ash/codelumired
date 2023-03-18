# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module Page
          module Index
            module Meta
              TRACK = 'visitorPageIndex'

              UNLOCALIZED_PATH = {
                pl: 'artykuly-o-wynajmie-nieruchomosci',
                en: 'articles-on-real-estate-lease-and-rent-in-Poland',
              }.freeze

              UNLOCALIZED_TITLE = {
                pl: 'Artykuły o wynajmnie nieruchomości',
                en: 'Articles on Real Estate Lease & Rent in Poland',
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
                @unlocalized_keywords ||= {
                  pl: 'TODO',
                  en: 'TODO',
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  pl: 'TODO',
                  en: 'TODO',
                }.freeze
              end

              def render
                {
                  visitorPageIndex: true,
                }
              end

              def links
                {
                  'current/pl': ::MapawynajmuPl::Api::Tracks::Visitor::Page::Index::Linker.new(:pl).call,
                  'current/en': ::MapawynajmuPl::Api::Tracks::Visitor::Page::Index::Linker.new(:en).call,
                }
              end
            end
          end
        end
      end
    end
  end
end
