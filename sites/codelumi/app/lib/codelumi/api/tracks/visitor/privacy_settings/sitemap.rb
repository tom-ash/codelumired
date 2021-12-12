# frozen_string_literal: true

module Codelumi
  module Api
    module Tracks
      module Visitor
        module PrivacySettings
          class Sitemap
            class << self
              include ::Codelumi::Api::Tracks::Visitor::PrivacySettings::Meta

              def get
                [links]
              end

              private

              def links
                [
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
