# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Root
        class Sitemap
          class << self
            def get
              [links]
            end

            private

            def links
              [
                { path: '', lang: :en, changefreq: 'weekly', priority: '1.0' }
              ]
            end
          end
        end
      end
    end
  end
end
