# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Index
          module User
            class Linker
              include ::MapawynajmuPl::Api::Tracks::Helpers::Linker
              include ::MapawynajmuPl::Api::Tracks::Announcement::Index::User::Meta
            end
          end
        end
      end
    end
  end
end
