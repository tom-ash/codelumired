# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Show
          class Sitemap
            class << self
              def get
                announcement_links
              end

              private

              def announcement_links
                links = []

                ::MapawynajmuPl::Announcement.where(user_verified: true, visible: true).all.each do |announcement|
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
  end
end
