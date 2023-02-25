# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Create
          class Appender
            include ::Api::Tracks::Helpers::Appender
            include ::SkillfindTech::Api::Tracks::User::Create::Meta
          end
        end
      end
    end
  end
end
