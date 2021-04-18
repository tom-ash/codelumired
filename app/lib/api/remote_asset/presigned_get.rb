# frozen_string_literal: true

module Api
  module RemoteAsset
    class PresignedGet < Grape::API
      params { requires :key, type: String }
      get do
        key = params[:key]
        signer = Aws::S3::Presigner.new(region: Rails.application.secrets.aws_region, credentials: CREDS)
        url = signer.presigned_url(:get_object, bucket: Rails.application.secrets.aws_bucket, key: key)

        { url: url }
      end
    end
  end
end
