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

              private

              def merge_state
                state.merge!(
                  'user/create/data': {
                    account_type: user.account_type,
                    business_name: user.business_name,
                    urlified_business_name: user.urlified_business_name,
                  },
                  texts: texts,
                )
              end
            end
          end
        end
      end
    end
  end
end
