# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Root
        class Linker
          include ::Warsawlease::Api::Tracks::Helpers::Linker
          include ::Warsawlease::Api::Tracks::Root::Meta

          private

          def url
            path = unlocalized_path[lang]
            return root_domain if path == '/'

            "#{root_domain}/#{path}"
          end
        end
      end
    end
  end
end
