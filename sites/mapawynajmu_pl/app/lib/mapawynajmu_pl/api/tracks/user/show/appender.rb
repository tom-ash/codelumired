# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Show
          class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
            include ::MapawynajmuPl::Api::Tracks::User::Show::Meta
          end
        end
      end
    end
  end
end
