# frozen_string_literal: true

module Api
  module RemoteAsset
    class PresignedPost < Grape::API
      params do
        optional :key, type: String
        optional :prefix, type: String
        optional :randomize_key, type: Boolean
        optional :file_type, type: String
      end
      post do
        randomized_suffix = params[:randomize_key] ? "#{Time.now.strftime('%Y%m%d%H%M%S%L')}#{SecureRandom.urlsafe_base64}.#{params[:file_type]}" : ''
        key = "#{params[:key]}#{randomized_suffix}"
        extended_key = "#{params[:prefix]}#{key}"

        post = Aws::S3::PresignedPost.new(
          CREDS,
          'eu-central-1',
          Rails.application.secrets.aws_bucket,
          key: extended_key,
          success_action_status: '201'
        )

        { fields: post.fields, url: post.url, key: key }
      end
    end
  end
end
