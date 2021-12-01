# frozen_string_literal: true

module Api
  module Visitor
    module Links
      class Build
        def initialize(site:, track:, lang:, unlocalized_title:)
          @site = site
          @track = track
          @lang = lang.to_sym
          @unlocalized_title = unlocalized_title
        end

        def call
          {
            url: url,
            title: title
          }
        end

        private

        attr_reader :site, :track, :lang, :unlocalized_title

        def url
          track_paths[track.to_sym][lang]
        end

        def title
          unlocalized_title[lang]
        end

        def track_paths
          site::Api::RouteData::ROUTE_DATA
        end
      end
    end
  end
end
