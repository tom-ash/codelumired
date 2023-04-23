# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Announcement
        module Create
          module Summary
            class Linker < SkillfindTech::Api::Tracks::Common::Linker
              include ::SkillfindTech::Api::Tracks::Announcement::Create::Summary::Meta
            end
          end
        end
      end
    end
  end
end
