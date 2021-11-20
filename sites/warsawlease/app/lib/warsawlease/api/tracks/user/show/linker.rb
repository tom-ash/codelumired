# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module User
        module Show
          class Linker
            include ::Api::Tracks::Helpers::Linker
            include ::Warsawlease::Api::Tracks::User::Show::Meta

            def call
              {
                title: title
              }
            end
          end
        end
      end
    end
  end
end
