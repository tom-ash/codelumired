# frozen_string_literal: true

module Api
  module User
    module Authorize
      class AccessToken < Grape::API
        before { authorize! }
        put do
          camelize(::Queries::User::SingleByEmail.new(email: current_user.email, constantized_site_name: constantized_site_name).call)
        end
      end
    end
  end
end
