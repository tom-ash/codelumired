# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Show
          class Linker < SkillfindTech::Api::Tracks::Common::Linker
            include ::SkillfindTech::Api::Tracks::Posting::Show::Meta
          end
        end
      end
    end
  end
end
