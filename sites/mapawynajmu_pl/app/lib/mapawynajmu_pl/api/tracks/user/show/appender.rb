# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Show
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::MapawynajmuPl::Api::Tracks::User::Show::Meta
          end
        end
      end
    end
  end
end
