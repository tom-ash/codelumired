# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module User
        module Edit
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::Warsawlease::Api::Tracks::User::Meta
          end
        end
      end
    end
  end
end
