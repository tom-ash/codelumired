# frozen_string_literal: true

module Commands
  module S3Object
    class Upload
      def initialize(attrs)
        @bucket = attrs[:bucket]
        @key = attrs[:key]
        @body = attrs[:body]
      end

      def call
        upload_s3_object
      end

      private

      attr_reader :bucket, :key, :body

      def upload_s3_object
        s3_client.put_object(
          bucket: bucket,
          key: key,
          body: body
        )
      end

      def s3_client
        Aws::S3::Client.new(region: Rails.application.secrets.aws_region)
      end
    end
  end
end
