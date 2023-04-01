# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Redirects
        module Index
          class Linker < ::Api::Tracks::Redirects::Index::Linker
            include ::SkillfindTech::Api::Tracks::Redirects::Index::Meta
            include ::SkillfindTech::ProtocolAndDomain
          end
        end
      end
    end
  end
end
