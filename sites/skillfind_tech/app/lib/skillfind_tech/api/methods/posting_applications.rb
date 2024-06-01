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
          requires :cv, type: String
          # optional :cover_letter, type: String
        end
        post do
          posting = ::SkillfindTech::PostingApplication.create!(
            posting_id: params[:posting_id],
            first_name: params[:first_name],
            last_name: params[:last_name],
            email: params[:email],
            phone_number: params[:phone_number],
            linked_in_profile: params[:linked_in_profile],
            git_hub_account: params[:git_hub_account],
            cv: params[:cv],
            # cover_letter: params[:cover_letter],
          )

          temporary_cv ||= Aws::S3::Object.new(
            credentials: CREDS,
            region: Rails.application.secrets.aws_region,
            bucket_name: bucket,
            key: "temporary/#{params[:cv]}",
          )

          temporary_cv.move_to("#{bucket}/postings/#{posting.posting_id}/applications/#{params[:cv]}")
        end
      end
    end
  end
end
