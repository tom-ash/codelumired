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
                en: 'add-posting',
                pl: 'dodaj-ogloszenie',
              }.freeze

              UNLOCALIZED_TITLE = {
                en: 'TODO',
                pl: 'TODO',
              }.freeze

              private

              def label
                'ASDASDASDAS'
              end

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
                  en: 'TODO',
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  en: 'TODO',
                }.freeze
              end

              def render
                {
                  'visitor': true,
                  'announcement': true,
                  'announcement/create': true,
                  'announcement/create/form': true,
                }
              end

              def links
                {
                  'current/en': ::SoundofIt::Api::Tracks::Announcement::Create::Form::Linker.new(:en).call,
                  'current/pl': ::SoundofIt::Api::Tracks::Announcement::Create::Form::Linker.new(:pl).call,
                }
              end
            end
          end
        end
      end
    end
  end
end
