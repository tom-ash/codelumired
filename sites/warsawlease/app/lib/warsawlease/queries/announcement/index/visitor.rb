# frozen_string_literal: true

module Warsawlease
  module Queries
    module Announcement
      module Index
        class Visitor
          def initialize(search_params: {})
            @search_params = search_params
          end

          def call
            ::Warsawlease::Announcement.where(visible: true, confirmed: true).order('points DESC').order('active_until DESC')
          end

          private

          attr_reader :search_params
        end
      end
    end
  end
end
