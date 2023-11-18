# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Create
          module Form
            class Sitemap
              class << self
                include ::MapawynajmuPl::Api::Tracks::Listing::Create::Form::Meta

                def get
                  [links]
                end

                private

                # def links
                #   [
                #     { path: unlocalized_path[:pl], lang: :pl, changefreq: 'monthly', priority: '1.0' },
                #     { path: unlocalized_path[:en], lang: :en, changefreq: 'monthly', priority: '1.0' }
                #   ]
                # end

                def links
                  MAPAWYNAJMU_PL_NAME_LANGS.map do |lang|
                    link = ::MapawynajmuPl::Api::Tracks::Listing::Create::Form::Linker.new(lang).call
    
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
  end
end
