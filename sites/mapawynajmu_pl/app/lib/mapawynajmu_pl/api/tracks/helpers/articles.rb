# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Helpers
        module Articles
          private

          def articles
            ::MapawynajmuPl::Page
            .select('url AS href, lang AS hrefLang, title, cover_image AS image')
            .where(
              online: true,
              lang: lang,
            )
            .order('priority ASC')
            .map do |article|
              article.attributes.merge(
                href: "/#{article.href}"
              )
            end
          end
        end
      end
    end
  end
end
