# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Auth
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::SkillfindTech::Api::Tracks::User::Auth::Meta
            include ::SkillfindTech::Api::Tracks::User::Auth::State
          end
        end
      end
    end
  end
end
