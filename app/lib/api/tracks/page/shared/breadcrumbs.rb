# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Shared
        module Breadcrumbs
          HOMEPAGE = {
            pl: 'Strona główna',
            en: 'Homepage',
          }

          private

          def breadcrumbs
            @breadcrumbs ||= begin
              parents = []

              buildBreadcrumbs(parents, page)

              parents.push(
                name: HOMEPAGE[lang],
                item: site::Api::Tracks::Root::Linker.new(lang).call[:href],
              )

              parents.reverse
            end
          end

          def buildBreadcrumbs(parents, page)
            if (page.parent_id)
              parent = site::Page.find(page.parent_id)

              parents.push({
                name: parent.title,
                item: "/#{parent.url}"
              })

              buildBreadcrumbs(parents, parent)
            end
          end
        end
      end
    end
  end
end
