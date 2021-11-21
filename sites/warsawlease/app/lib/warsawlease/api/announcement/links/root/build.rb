# frozen_string_literal: true

module Warsawlease
  module Api
    module Announcement
      module Links
        module Root
          class Build < ::Warsawlease::Api::Announcement::Tracks::Base
            include ::Warsawlease::Api::RouteData
            include ::Warsawlease::Api::Tracks::Root::Meta

            def initialize(lang)
              @lang = lang.to_sym
            end

            def call
              {
                url: url,
                title: title
              }
            end

            private

            def url
              @url ||= begin
                path = track_paths[:root][lang]
                "#{root_domain}#{path == '/' ? '' : "/#{path}"}"
              end
            end
          end
        end
      end
    end
  end
end
