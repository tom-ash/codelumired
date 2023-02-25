# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            class Linker
              include ::Api::Tracks::Helpers::Linker
              include ::SkillfindTech::Api::Tracks::Announcement::Create::Form::Meta

              private

              def label
                'ASDASDASDAS'
              end
            end
          end
        end
      end
    end
  end
end
