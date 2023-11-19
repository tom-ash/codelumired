# frozen_string_literal: true

module Api
  module Tracks
    module Common
      class Sitemap
        class << self
          def get
            [links]
          end

          private

          def links
            appLangs.map do |lang|
              link = linker.new(lang).getForSitemap

              {
                href: link[:href],
                hrefLang: link[:hrefLang],
                priority: link[:priority],
                changeFreq: link[:changeFreq],
              }
            end
          end

          def linker
            @linker ||= self.to_s.gsub(/::Sitemap$/, '').constantize::Linker
          end
        end
      end
    end
  end
end
