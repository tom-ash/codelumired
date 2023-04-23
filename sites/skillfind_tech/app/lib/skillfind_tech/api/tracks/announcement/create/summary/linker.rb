# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Listing
        module Create
          module Summary
            class Linker < SkillfindTech::Api::Tracks::Common::Linker
              include ::SkillfindTech::Api::Tracks::Listing::Create::Summary::Meta
            end
          end
        end
      end
    end
  end
end
