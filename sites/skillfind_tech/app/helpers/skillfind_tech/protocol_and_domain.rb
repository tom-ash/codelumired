# frozen_string_literal: true

module SkillfindTech
  module ProtocolAndDomain
    private

    def protocol_and_domain
      return Rails.env.production? ? SKILLFIND_TECH_URL : SKILLFIND_TECH_URL_DEV
    end

    def domain
      return Rails.env.production? ? SKILLFIND_TECH_DOMAIN : SKILLFIND_TECH_DOMAIN_DEV
    end
  end
end
