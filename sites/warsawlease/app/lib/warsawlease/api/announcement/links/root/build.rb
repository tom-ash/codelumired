# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Links
        module Root
          class Build < ::Warsawlease::Api::Announcement::Tracks::Base
            include ::Warsawlease::Api::RouteData
            include ::Warsawlease::Api::Announcement::Tracks::Root::Meta

            def initialize(lang)
              @lang = lang.to_sym
            end

            def call
              {
                url: url,
                lang: lang,
                title: title
              }
            end

            private

            def url
              @url ||= begin
                path = route_data.key(track: 'root', lang: lang).to_s
                "#{root_domain}#{path == '/' ? '' : "/#{path}"}"
              end
            end
          end
        end
      end
    end
  end
end
