# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module SocialPages
        module Facebook
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            def call
              {
                href: 'https://www.facebook.com/profile.php?id=100091302428884',
                external: true,
              }
            end
          end
        end
      end
    end
  end
end
