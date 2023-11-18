# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Sitemap
          class << self
            def get
              [root_links]# + category_links
            end

            private

            def root_links
              MAPAWYNAJMU_PL_NAME_LANGS.map do |lang|
                link = ::MapawynajmuPl::Api::Tracks::Root::Linker.new(lang).call

                {
                  href: link[:href],
                  hrefLang: link[:hrefLang],
                  priority: 1,
                  changeFreq: 'daily',
                }
              end
            end
          end
        end
      end
    end
  end
end
