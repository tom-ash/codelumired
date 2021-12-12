# frozen_string_literal: true

module Codelumi
  module Api
    module Tracks
      module Visitor
        module Contact
          class Sitemap
            class << self
              include ::Codelumi::Api::Tracks::Visitor::Contact::Meta

              def get
                [links]
              end

              private

              def links
                [
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
