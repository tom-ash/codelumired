# frozen_string_literal: true

module Codelumi
  module Api
    module Tracks
      module Visitor
        module PrivacyPolicy
          class Linker
            include ::Api::Tracks::Helpers::Linker
            include ::Codelumi::Api::Tracks::Visitor::PrivacyPolicy::Meta
          end
        end
      end
    end
  end
end
