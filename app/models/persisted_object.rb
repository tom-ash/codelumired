# frozen_string_literal: true

class PersistedObject
  def initialize(source_key)
    @source_key = source_key
  end

  def move_to(target)
    s3_object.move_to("#{bucket_name}/#{target}")
  end

  private

  attr_reader :source_key

  def s3_object
    @s3_object ||= Aws::S3::Object.new(
      credentials: CREDS,
      region: Rails.application.secrets.aws_region,
      bucket_name: bucket_name,
      key: source_key
    )
  end

  def bucket_name
    Rails.application.secrets.aws_bucket
  end
end
