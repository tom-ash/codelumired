# frozen_string_literal: true

module Warsawlease
  module Serializers
    module Announcement
      class AvailabilityDate
        def initialize(availability_date)
          @availability_date = availability_date
        end

        def call
          return if availability_date.blank?
          return 'now' if Date.current >= availability_date.to_date

          availability_date
        end

        private

        attr_reader :availability_date
      end
    end
  end
end
