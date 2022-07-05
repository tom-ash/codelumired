# frozen_string_literal: true

module Api
  module Methods
    module Page
      module Sitemap
        class << self
          def get(site, langs)
            page_links(site, langs)
          end

          private

          def page_links(site, langs)
            links = []

            site::Page.all.where(lang: langs, online: true).group_by(&:lang_alts_group).each_value do |pages|
              link = []
              pages.each do |page|
                next if page.canonical_url.present?

                link << {
                  path: page.url,
                  lang: page.lang,
                  changefreq: 'monthly',
                  modifiedon: page.modified_on,
                  priority: '1.0'
                }
              end

              links << link if link.any?
            end

            links
          end
        end
      end
    end
  end
end
