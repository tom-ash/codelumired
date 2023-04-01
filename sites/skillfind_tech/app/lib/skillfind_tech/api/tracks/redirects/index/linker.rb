# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Redirects
        module Index
          class Linker < SkillfindTech::Api::Tracks::Common::Linker
            include ::SkillfindTech::Api::Tracks::Redirects::Index::Meta
            include ::SkillfindTech::ProtocolAndDomain
          end
        end
      end
    end
  end
end
