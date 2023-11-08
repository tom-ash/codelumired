# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Root
        class Linker < SkillfindTech::Api::Tracks::Common::Linker
          include ::SkillfindTech::Api::Tracks::Root::Meta
        end
      end
    end
  end
end
