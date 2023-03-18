# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Confirmation
            class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
              include ::MapawynajmuPl::Api::Tracks::User::Create::Confirmation::Meta
              include ::MapawynajmuPl::Api::Tracks::User::Create::Confirmation::Texts
              include ::MapawynajmuPl::Api::Tracks::User::Create::Confirmation::Assets

              private

              def data
                {
                  accountType: user.account_type,
                  businessName: user.business_name,
                }
              end
            end
          end
        end
      end
    end
  end
end
