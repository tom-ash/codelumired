# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module Page
          module Index
            class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
              include ::MapawynajmuPl::Api::Tracks::Visitor::Page::Index::Meta

              def data
                {
                  pages: pages,
                }
              end

              def pages
                ::MapawynajmuPl::Page.where(category: 'articles', lang: lang).all
              end
            end
          end
        end
      end
    end
  end
end
