# frozen_string_literal: true

module Warsawlease
  module Queries
    module Announcement
      module Sitemap
        class << self
          def get(site)
            announcement_links
          end

          private

          def announcement_links
            links = []

            ::Warsawlease::Announcement.where(confirmed: true, visible: true).all.each do |announcement|
              link = []

              %i[pl en].each do |lang|
                link << { path: announcement.url(lang), lang: lang, changefreq: 'weekly', priority: '0.8' }
              end

              links << link
            end

            links
          end
        end
      end
    end
  end
end
