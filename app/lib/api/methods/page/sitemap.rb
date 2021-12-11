# frozen_string_literal: true

module Api
  module Methods
    module Page
      module Sitemap
        class << self
          def get(site)
            page_links(site)
          end

          private

          def page_links(site)
            links = []

            site::Page.all.group_by(&:name).each_value do |pages|
              link = []
              pages.each do |page|
                next if page.canonical_url.present?

                link << { path: page.url, lang: page.lang, changefreq: 'monthly', priority: '0.9' }
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
