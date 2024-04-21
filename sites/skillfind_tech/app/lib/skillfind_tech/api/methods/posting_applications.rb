# frozen_string_literal: true

module SkillfindTech
  module Api
    module Methods
      class PostingApplications < Grape::API
        params do
          requires :posting_id, type: Integer
          requires :first_name, type: String
          requires :last_name, type: String
          requires :email, type: String
          optional :phone_number, type: String
          optional :linked_in_profile, type: String
          optional :git_hub_account, type: String
        end
        post do
          # byebug
          ::SkillfindTech::PostingApplication.create!(
            posting_id: params[:posting_id],
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
          )
        end
      end
    end
  end
end
