# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Create
          module Confirmation
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::MapawynajmuPl::Api::Tracks::User::Create::Confirmation::Meta
              include ::MapawynajmuPl::Api::Tracks::User::Create::Confirmation::Texts
              include ::MapawynajmuPl::Api::Tracks::User::Create::Confirmation::Assets

              private

              def data
                {
                  account_type: user.account_type,
                  business_name: user.business_name,
                }
              end
            end
          end
        end
      end
    end
  end
end
