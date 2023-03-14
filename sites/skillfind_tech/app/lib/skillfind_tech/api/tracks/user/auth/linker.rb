# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Auth
          class Linker
            include ::SkillfindTech::Api::Tracks::Helpers::Linker
            include ::SkillfindTech::Api::Tracks::User::Auth::Meta
          end
        end
      end
    end
  end
end
