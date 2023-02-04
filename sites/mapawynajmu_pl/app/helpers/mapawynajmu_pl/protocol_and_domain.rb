# frozen_string_literal: true

module MapawynajmuPl
  module ProtocolAndDomain
    private

    def protocol_and_domain
      Rails.env.production? ? MAPAWYNAJMU_PL_URL : MAPAWYNAJMU_PL_DEV_URL
    end
  end
end
