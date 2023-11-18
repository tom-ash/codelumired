# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Root
        class Sitemap
          class << self
            def get
              [root_links]
            end

            private

            def root_links
              SKILLFIND_TECH_NAME_LANGS.map do |lang|
                link = ::SkillfindTech::Api::Tracks::Root::Linker.new(lang).call

                {
                  href: link[:href],
                  hrefLang: link[:hrefLang],
                  priority: '1.0',
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
