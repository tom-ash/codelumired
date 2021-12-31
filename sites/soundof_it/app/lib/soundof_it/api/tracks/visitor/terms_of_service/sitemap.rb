# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Visitor
        module TermsOfService
          class Sitemap
            class << self
              include ::SoundofIt::Api::Tracks::Visitor::TermsOfService::Meta

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
