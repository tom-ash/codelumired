# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Visitor
        module Contact
          class Sitemap
            class << self
              include ::Warsawlease::Api::Tracks::Visitor::Contact::Meta

              def get
                [links]
              end

              private

              def links
                [
                  { path: unlocalized_path[:pl], lang: :pl, changefreq: 'monthly', priority: '0.8' },
                  { path: unlocalized_path[:en], lang: :en, changefreq: 'monthly', priority: '0.8' }
                ]
              end
            end
          end
        end
      end
    end
  end
end
