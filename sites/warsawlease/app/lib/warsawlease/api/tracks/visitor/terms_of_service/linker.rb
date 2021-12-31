# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module TermsOfService
          class Linker
            include ::MapawynajmuPl::Api::Tracks::Helpers::Linker
            include ::MapawynajmuPl::Api::Tracks::Visitor::TermsOfService::Meta
          end
        end
      end
    end
  end
end
