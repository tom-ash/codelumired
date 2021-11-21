# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            class Linker
              include ::Warsawlease::Api::Tracks::Helpers::Linker
              include ::Warsawlease::Api::Tracks::Announcement::Create::Form::Meta
            end
          end
        end
      end
    end
  end
end
