# frozen_string_literal: true

module SoundofIt
  module Api
    module Tracks
      module Announcement
        module Create
          module Form
            class Appender
              include ::Api::Tracks::Helpers::Appender
              include ::SoundofIt::Api::Tracks::Announcement::Create::Form::Meta

              def merge_state
                state.merge!(
                  'announcement/create': {
                    selectable_skills: ::SoundofIt::Skill.all
                  }
                )
              end
            end
          end
        end
      end
    end
  end
end
