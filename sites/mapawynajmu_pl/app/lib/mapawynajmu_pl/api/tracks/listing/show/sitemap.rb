# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Show
          class Sitemap
            class << self
              def get
                listingLinkGroups
              end

              private

              def listingLinkGroups
                linkGroups = []

                ::MapawynajmuPl::Listing.where(user_verified: true, visible: true, deleted_at: nil).all.each do |announcement|
                  linkGroup = []

                  %i[pl en].each do |lang|
                    linkGroup << {
                      href: "/#{announcement.url(lang)}",
                      hrefLang: lang,
                      changeFreq: 'weekly',
                      priority: '0.9'
                    }
                  end

                  linkGroups << linkGroup
                end

                linkGroups
              end
            end
          end
        end
      end
    end
  end
end
