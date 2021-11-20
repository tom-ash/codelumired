# frozen_string_literal: true

module Codelumi
  module Api
    module Tracks
      module User
        module Create
          class Appender
            include ::Codelumi::Api::Tracks::Helpers::Appender
            include ::Codelumi::Api::Tracks::User::Create::Meta
          end
        end
      end
    end
  end
end
