# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Visitor
        module TermsOfService
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::Warsawlease::Api::Tracks::Visitor::TermsOfService::Meta
          end
        end
      end
    end
  end
end
