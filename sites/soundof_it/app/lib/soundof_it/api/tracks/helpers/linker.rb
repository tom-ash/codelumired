# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Helpers
        module Linker
          include ::Api::Tracks::Helpers::Linker

          private

          def protocol_and_domain
            Rails.env.production? ? SOUNDOF_IT_URL : SOUNDOF_IT_URL_DEV
          end

          def domain
            Rails.env.production? ? SOUNDOF_IT_DOMAIN_DEV : SOUNDOF_IT_URL_DEV
          end
        end
      end
    end
  end
end
