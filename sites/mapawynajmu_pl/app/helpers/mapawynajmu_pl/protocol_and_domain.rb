# frozen_string_literal: true

module MapawynajmuPl
  module ProtocolAndDomain
    private

    def protocol_and_domain
      if to_s.include?('SkillfindTech')
        return Rails.env.production? ? SKILLFIND_TECH_URL : SKILLFIND_TECH_URL_DEV
      end

      Rails.env.production? ? MAPAWYNAJMU_PL_URL : MAPAWYNAJMU_PL_URL_DEV
    end

    def domain
      if to_s.include?('SkillfindTech')
        return Rails.env.production? ? SKILLFIND_TECH_DOMAIN : SKILLFIND_TECH_DOMAIN_DEV
      end

      Rails.env.production? ? MAPAWYNAJMU_PL_DOMAIN : MAPAWYNAJMU_PL_DOMAIN_DEV
    end

    def api_protocol_and_domain
      if to_s.include?('SkillfindTech')
        return Rails.env.production? ? SKILLFIND_TECH_API_URL : SKILLFIND_TECH_API_URL_DEV
      end

      Rails.env.production? ? MAPAWYNAJMU_PL_API_URL : MAPAWYNAJMU_PL_API_URL_DEV
    end
  end
end
