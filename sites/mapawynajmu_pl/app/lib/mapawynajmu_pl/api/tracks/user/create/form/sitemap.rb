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
                  [
                    { path: unlocalized_path[:pl], lang: :pl, changefreq: 'monthly', priority: '0.7' },
                    { path: unlocalized_path[:en], lang: :en, changefreq: 'monthly', priority: '0.7' }
                  ]
                end
              end
            end
          end
        end
      end
    end
  end
end
