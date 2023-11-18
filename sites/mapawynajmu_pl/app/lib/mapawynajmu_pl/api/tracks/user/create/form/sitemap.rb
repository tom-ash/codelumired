# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Form
            class Sitemap
              class << self
                include ::MapawynajmuPl::Api::Tracks::User::Create::Form::Meta

                def get
                  [links]
                end

                private

                def links
                  MAPAWYNAJMU_PL_NAME_LANGS.map do |lang|
                    link = ::MapawynajmuPl::Api::Tracks::User::Create::Form::Linker.new(lang).call
    
                    {
                      href: link[:href],
                      hrefLang: link[:hrefLang],
                      priority: '0.5',
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
