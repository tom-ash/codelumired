# frozen_string_literal: true

module SkillfindTech
  module Api
    module Tracks
      module User
        module Postings
          module Index
            module Meta
              TRACK = 'user/postings/index'

              UNLOCALIZED_PATH = {
                en: 'added-postings',
                pl: 'pl/dodane-ogloszenia',
              }.freeze

              UNLOCALIZED_TITLE = {
                en: 'Added Postings',
                pl: 'Dodane ogłoszenia',
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
                  en: 'TOOD',
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  en: 'TODO',
                }.freeze
              end

              def render
                {
                  "#{TRACK}": true
                }
              end

              def links
                {
                  'current/en': ::SkillfindTech::Api::Tracks::User::Postings::Index::Linker.new(:en).call,
                  'current/pl': ::SkillfindTech::Api::Tracks::User::Postings::Index::Linker.new(:pl).call,
                }
              end
            end
          end
        end
      end
    end
  end
end
