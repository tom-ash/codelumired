# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Listing
        module Create
          module Form
            class Linker < SkillfindTech::Api::Tracks::Common::Linker
              include ::SkillfindTech::Api::Tracks::Listing::Create::Form::Meta
            end
          end
        end
      end
    end
  end
end
