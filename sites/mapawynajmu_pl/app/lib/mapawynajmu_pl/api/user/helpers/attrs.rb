# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module User
      module Helpers
        module Attrs
          extend Grape::API::Helpers

          params :user_attrs do
            requires :user, type: Hash do
              requires :email_address, type: String
              requires :password, type: String
              requires :country_code, type: String
              requires :phone_number, type: String
              requires :consents, type: Array do
                requires :type, type: String
                requires :granted, type: Boolean
                requires :displayed_text, type: String
              end
            end
          end
        end
      end
    end
  end
end
