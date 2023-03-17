# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Show
          class Linker < ::MapawynajmuPl::Api::Tracks::Common::Linker
            include ::MapawynajmuPl::Api::Tracks::User::Show::Meta

            def call
              {
                title: title,
              }
            end
          end
        end
      end
    end
  end
end
