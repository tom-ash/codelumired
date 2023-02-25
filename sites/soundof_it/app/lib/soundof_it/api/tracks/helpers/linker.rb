# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Helpers
        module Linker
          include ::Api::Tracks::Helpers::Linker

          private

          def protocol_and_domain
            Rails.env.production? ? SKILLFIND_TECH_URL : SKILLFIND_TECH_URL_DEV
          end

          def domain
            Rails.env.production? ? SKILLFIND_TECH_DOMAIN_DEV : SKILLFIND_TECH_URL_DEV
          end
        end
      end
    end
  end
end
