# frozen_string_literal: true

module SkillfindTech
  module Api
    class Users < Grape::API
      params do
        requires :email_address, type: String
        requires :password, type: String
      end
      post do
        ::SkillfindTech::Commands::Users::Create.new(params).call
      end
    end
  end
end
