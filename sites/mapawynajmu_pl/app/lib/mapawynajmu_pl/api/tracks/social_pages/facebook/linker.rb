# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module SocialPages
        module Facebook
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            def call
              {
                href: 'https://www.facebook.com/mapawynajmupl',
                external: true,
              }
            end
          end
        end
      end
    end
  end
end
