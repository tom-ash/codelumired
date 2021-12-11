# frozen_string_literal: true

module Warsawlease
  module Api
    module Sitemap
      class Get < Grape::API
        helpers do
          def mappers
            [
              ::Warsawlease::Api::Tracks::Root::Mapper,
              ::Api::Methods::Page::Sitemap
            ]
          end
        end

        get do
          link_groups = []

          mappers.each do |mapper|
            link_groups += mapper.get(site)
          end

          link_groups
        end
      end
    end
  end
end
