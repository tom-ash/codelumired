# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            module Meta
              TRACK = 'announcement/create/form'

              UNLOCALIZED_PATH = {
                en: 'post-a-job'
              }.freeze

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

              def render
                {
                  'visitor': true,
                  'announcement': true,
                  'announcement/create': true,
                  'announcement/create/form': true
                  # 'page': true,
                  # 'page/show': true
                }
              end
            end
          end
        end
      end
    end
  end
end
