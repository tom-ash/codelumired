# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Visitor
        module TermsOfService
          class Sitemap
            class << self
              include ::Warsawlease::Api::Tracks::Visitor::TermsOfService::Meta

              def get
                [links]
              end

              private

              def links
                [
                  { path: unlocalized_path[:pl], lang: :pl, changefreq: 'monthly', priority: '0.4' },
                  { path: unlocalized_path[:en], lang: :en, changefreq: 'monthly', priority: '0.4' }
                ]
              end
            end
          end
        end
      end
    end
  end
end
