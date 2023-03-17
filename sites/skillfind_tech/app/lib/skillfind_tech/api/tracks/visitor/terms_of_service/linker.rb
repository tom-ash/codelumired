# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Visitor
        module TermsOfService
          class Linker < SkillfindTech::Api::Tracks::Common::Linker
            include ::SkillfindTech::Api::Tracks::Visitor::TermsOfService::Meta
          end
        end
      end
    end
  end
end
