# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module SocialPages
        module Linkedin
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            def call
              {
                href: 'https://www.linkedin.com/company/skillfind-tech/',
                external: true,
              }
            end
          end
        end
      end
    end
  end
end
