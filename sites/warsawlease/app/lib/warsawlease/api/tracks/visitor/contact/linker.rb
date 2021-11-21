# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Visitor
        module Contact
          class Linker
            include ::Warsawlease::Api::Tracks::Helpers::Linker
            include ::Warsawlease::Api::Tracks::Visitor::Contact::Meta
          end
        end
      end
    end
  end
end
