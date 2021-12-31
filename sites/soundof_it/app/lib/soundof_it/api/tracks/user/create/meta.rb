# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module User
        module Create
          module Meta
            TRACK = 'user/create'

            UNLOCALIZED_PATH = {
              en: 'TODO'
            }

            UNLOCALIZED_TITLE = {
              en: 'TODO'
            }.freeze

            private

            def track
              @track ||= TRACK
            end

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end

            def unlocalized_title
              @unlocalized_title ||= UNLOCALIZED_TITLE
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                en: 'TODO'
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                en: 'TODO'
              }.freeze
            end
          end
        end
      end
    end
  end
end
