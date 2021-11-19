# frozen_string_literal: true

module Api
  module Visitor
    module Links
      class Build
        def initialize(site:, track:, lang:, root_domain:, unlocalized_title:)
          @site = site
          @track = track
          @lang = lang.to_sym
          @root_domain = root_domain
          @unlocalized_title = unlocalized_title
        end

        def call
          {
            url: url,
            title: title
          }
        end

        private

        attr_reader :site, :track, :lang, :root_domain, :unlocalized_title

        def url
          path = route_data[track.to_sym][lang]
          "#{root_domain}/#{path}"
        end

        def title
          unlocalized_title[lang]
        end

        def route_data
          site::Api::RouteData::ROUTE_DATA
        end
      end
    end
  end
end
