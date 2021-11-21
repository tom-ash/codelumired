# frozen_string_literal: true

module Warsawlease
  module Api
    module Tracks
      module Announcement
        module Create
          module Summary
            module Meta
              TRACK = 'announcement/create/summary'

              UNLOCALIZED_PATH = {
                pl: 'podsumowanie-dodanego-ogloszenia',
                en: 'added-announcement-summary'
              }.freeze

              UNLOCALIZED_TITLE = {
                pl: 'Podsumowanie dodanego ogłoszenia',
                en: 'Added Announcement Summary'
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
                  pl: 'dodane, ogłoszenie, podsumowanie, użytkownik, warsawlease.pl, ogłoszenia, wynajem, nieruchomości, warszawa',
                  en: 'added, announcement, summary, user, warsawlease.pl, announcement, lease, real estate, warsaw'
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  pl: 'Podsumowanie ogłoszenia dodanego na warsawlease.pl - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.',
                  en: 'Summary of an announcement added on warsawlease.pl - a service featuring real estate lease announcements in Warsaw.'
                }.freeze
              end
            end
          end
        end
      end
    end
  end
end
