# frozen_string_literal: true

module Warsawlease
  module Api
    module Sitemap
      class Get < Grape::API
        helpers do
          def sitemap_data
            [
              ::Warsawlease::Api::Tracks::Root::Meta::UNLOCALIZED_PATH
            ]
          end
        end

        get do
          ::Warsawlease::Api::Tracks::Root::Mapper.new.call

        end
      end
    end
  end
end
