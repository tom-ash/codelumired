# frozen_string_literal: true

module Api
  module Tracks
    module Page
      module Show
        class Appender < ::Api::Tracks::Common::Appender
          def initialize(attrs)
            @page = attrs[:page]
            super
          end

          private

          attr_reader :page

          def data
            ::Serializers::Page::Show.new(page: page, constantized_site_name: constantized_site_name).call
          end
        end
      end
    end
  end
end
