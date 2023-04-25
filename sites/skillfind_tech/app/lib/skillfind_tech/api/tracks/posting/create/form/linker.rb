# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Posting
        module Create
          module Form
            class Linker < SkillfindTech::Api::Tracks::Common::Linker
              include ::SkillfindTech::Api::Tracks::Posting::Create::Form::Meta
            end
          end
        end
      end
    end
  end
end
