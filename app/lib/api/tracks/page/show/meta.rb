# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Show
        module Meta
          TRACK = 'page/show'

          private

          def render
            {
              page: true,
              'page/show': true
            }
          end

          def links
            page_pl = site::Page.find_by(name: page.name, lang: :pl)
            page_en = site::Page.find_by(name: page.name, lang: :en)

            {
              'page/edit': { path: page.edit_link },
              'current/pl': { path: page_pl.show_link, title: page_pl.title },
              'current/en': { path: page_en.show_link, title: page_en.title }
            }
          end

          def asset_names
            @asset_names ||= begin
              assets = page.meta['assets'] || ''
              assets.split(', ').map(&:to_sym).push(:edit)
            end
          end
        end
      end
    end
  end
end
