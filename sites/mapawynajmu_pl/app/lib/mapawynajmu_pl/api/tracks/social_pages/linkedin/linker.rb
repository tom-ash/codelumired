# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module SocialPages
        module Linkedin
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            def call
              {
                href: 'https://www.linkedin.com/company/mapawynajmu-pl/',
                external: true,
              }
            end
          end
        end
      end
    end
  end
end
