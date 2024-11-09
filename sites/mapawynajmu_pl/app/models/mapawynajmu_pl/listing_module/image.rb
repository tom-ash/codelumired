# frozen_string_literal: true

module MapawynajmuPl
  module ListingModule
    module Image
      def image
        if social_image
          return "#{aws_s3_url}/listings/#{id}/social_image/#{social_image}"
        end

        "#{aws_s3_url}/#{announcement_path}/#{key}"
      end

      private

      def aws_s3_url
        case Rails.env
        when 'production'
          'https://warsawlease.s3.eu-central-1.amazonaws.com'
        when 'development'
          'https://warsawleasedev.s3.eu-central-1.amazonaws.com'
        end
      end

      def announcement_path
        "announcements/#{id}"
      end

      def key
        pictures.first['database']
      end
    end
  end
end
