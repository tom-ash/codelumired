# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module ResetPassword
          class Linker < ::SkillfindTech::Api::Tracks::Common::Linker
            include ::SkillfindTech::Api::Tracks::User::ResetPassword::Meta
          end
        end
      end
    end
  end
end
