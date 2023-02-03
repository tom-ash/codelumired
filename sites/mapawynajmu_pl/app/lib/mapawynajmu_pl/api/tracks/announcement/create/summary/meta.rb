# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Announcement
        module Create
          module Summary
            module Meta
              TRACK = 'announcement/create/summary'

              UNLOCALIZED_PATH = {
                pl: %r{^podsumowanie-dodanego-ogloszenia/(\d+)$},
                en: %r{^added-announcement-summary/(\d+)$},
              }.freeze

              UNLOCALIZED_TITLE = {
                pl: 'Podsumowanie dodanego ogłoszenia',
                en: 'Added Announcement Summary',
              }.freeze

              private

              def id
                @id ||= unlocalized_path[lang].match(url)[1]
              end

              def announcement
                @announcement ||= ::MapawynajmuPl::Announcement.find(id)
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
                  pl: "dodane, ogłoszenie, podsumowanie, użytkownik, #{MAPAWYNAJMU_PL_NAME}, ogłoszenia, wynajem, nieruchomości, warszawa",
                  en: "added, announcement, summary, user, #{MAPAWYNAJMU_PL_NAME}, announcement, lease, real estate, warsaw",
                }.freeze
              end

              def unlocalized_description
                @unlocalized_description ||= {
                  pl: "Podsumowanie ogłoszenia dodanego na #{MAPAWYNAJMU_PL_NAME} - serwisu z ogłoszeniami wynajmu nieruchomości w Warszawie.",
                  en: "Summary of an announcement added on #{MAPAWYNAJMU_PL_NAME} - a service featuring real estate lease announcements in Warsaw.",
                }.freeze
              end

              def render
                {
                  'visitor': true,
                  'announcement': true,
                  'announcement/create': true,
                  'announcement/create/summary': true,
                }
              end

              def links
                {
                  'current/pl': { path: announcement.summary_path(:pl) },
                  'current/en': { path: announcement.summary_path(:en) },
                  'announcement/show': { path: announcement.url(lang) },
                }
              end

              def asset_names
                @asset_names ||= %i[facebook]
              end
            end
          end
        end
      end
    end
  end
end
