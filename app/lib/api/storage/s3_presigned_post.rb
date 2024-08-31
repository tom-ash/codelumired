# frozen_string_literal: true

module Api
  module Storage
    class S3PresignedPost < Grape::API
      params do
        requires :key, type: String
        requires :content_type, type: String
      end
      post do
        key = params[:key]
        content_type = params[:content_type]

        post = Aws::S3::PresignedPost.new(
          CREDS,
          'eu-central-1',
          bucket,
          key: key,
          success_action_status: '201',
          # acl: 'public-read',
          content_type: content_type
        )

        { fields: post.fields, url: post.url, key: key }
      end
    end
  end
end
