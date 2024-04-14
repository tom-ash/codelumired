# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Show
          class Sitemap
            class << self
              include ::SkillfindTech::Api::Tracks::Posting::Create::Form::Meta

              def get
                [links]
              end

              private

              def links
                [
                  { path: unlocalized_path[:en], lang: :en, changefreq: 'monthly', priority: '1.0' }
                ]
              end
            end
          end
        end
      end
    end
  end
end
