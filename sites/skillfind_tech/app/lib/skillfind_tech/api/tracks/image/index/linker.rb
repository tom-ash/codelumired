# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Image
        module Index
          class Linker < ::Api::Tracks::Image::Index::Linker
            include ::SkillfindTech::Api::Tracks::Image::Index::Meta
            include ::SkillfindTech::ProtocolAndDomain
          end
        end
      end
    end
  end
end
