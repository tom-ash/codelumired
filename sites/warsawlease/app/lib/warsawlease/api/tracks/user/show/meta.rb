# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module User
        module Show
          module Meta
            TRACK = 'user/show'

            UNLOCALIZED_TITLE = {
              pl: 'Moje Konto',
              en: 'My Account'
            }.freeze

            private

            def track
              @track ||= TRACK
            end

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end
          end
        end
      end
    end
  end
end
