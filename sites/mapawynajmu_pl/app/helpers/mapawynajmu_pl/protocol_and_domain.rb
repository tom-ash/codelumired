# frozen_string_literal: true

module MapawynajmuPl
  module ProtocolAndDomain
    private

    def protocol_and_domain
      Rails.env.production? ? MAPAWYNAJMU_PL_URL : MAPAWYNAJMU_PL_URL_DEV
    end

    def domain
      Rails.env.production? ? MAPAWYNAJMU_PL_ROOT_DOMAIN : MAPAWYNAJMU_PL_ROOT_DOMAIN_DEV
    end
  end
end
