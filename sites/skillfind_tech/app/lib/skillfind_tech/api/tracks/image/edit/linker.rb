# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Image
        module Edit
          class Linker < ::Api::Tracks::Image::Edit::Linker
            include ::SkillfindTech::Api::Tracks::Image::Edit::Meta
            include ::SkillfindTech::ProtocolAndDomain
          end
        end
      end
    end
  end
end
