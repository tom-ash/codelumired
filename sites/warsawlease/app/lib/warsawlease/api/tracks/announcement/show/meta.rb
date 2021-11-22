# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Show
          module Meta
            TRACK = 'announcement/show'

            UNLOCALIZED_PATH = {
              pl: //, # TODO
              en: // # TODO
            }.freeze

            private

            def track
              @track ||= TRACK
            end

            def unlocalized_path
              @unlocalized_path ||= UNLOCALIZED_PATH
            end

            def unlocalized_title
              # TODO
            end

            def unlocalized_keywords
              @unlocalized_keywords ||= {
                pl: '',
                en: ''
              }.freeze
            end

            def unlocalized_description
              @unlocalized_description ||= {
                pl: '',
                en: ''
              }.freeze
            end
          end
        end
      end
    end
  end
end
