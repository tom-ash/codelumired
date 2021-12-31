# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Visitor
        module CookiesPolicy
          class Linker
            include ::MapawynajmuPl::Api::Tracks::Helpers::Linker
            include ::MapawynajmuPl::Api::Tracks::Visitor::CookiesPolicy::Meta
          end
        end
      end
    end
  end
end
