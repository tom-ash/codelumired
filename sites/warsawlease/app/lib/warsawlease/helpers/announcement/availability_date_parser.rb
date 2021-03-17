# frozen_string_literal: true

module Warsawlease
  module Helpers
    module Announcement
      class AvailabilityDateParser
        def initialize(availability_date)
          @availability_date = availability_date
        end

        def call
          { availability_date: parsed_availability_date }
        end

        private

        attr_reader :availability_date

        def parsed_availability_date
          return { availability_date: Date.current } if availability_date == 'now'

          availability_date
        end
      end
    end
  end
end
