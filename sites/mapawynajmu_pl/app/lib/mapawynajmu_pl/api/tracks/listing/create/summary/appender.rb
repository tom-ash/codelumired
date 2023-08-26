# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Listing
        module Create
          module Summary
            class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
              include ::MapawynajmuPl::Api::Tracks::Listing::Create::Summary::Meta

              private

              def texts
                {
                  pl: {
                    boostButtonLabel: 'Wyróżnij ogłoszenie',
                    shareOnFacebookButtonLabel: 'Udostępnij na Facebook\'u',
                    congratulations: 'Gratulacje! Twoje ogłoszenie zostało dodane!',
                    bumpingUpAndFacebookSharingBenefits: 'Wyróżniając ogłoszenie i udostępniając na Facebook\'u zwiększasz szansę na skuteczny wynajem.',
                    promotionBenefits: [
                      {
                        item: 'Pierwszeństwo na liście',
                        explanation: 'wyróżnione ogłoszenia prezentowane są na liście przed ogłoszeniami zwykłymi'
                      },
                      {
                        item: 'Zwiększona widoczność na mapie',
                        explanation: 'pinezki wyróżnionych ogłoszeń prezentowane są na mapie ponad pinezkami ogłoszeń zwykłych'
                      },
                      {
                        item: 'Lepsza Prezentacja',
                        explanation: 'wyróżnione ogłoszenia podświetlone są na złoto na liście i na mapie'
                      },
                    ],
                    promotionBenefitsSummary: 'Większa widoczność i zasięgi',
                  },
                  en: {
                    boostButtonLabel: 'Promote the Listing',
                    shareOnFacebookButtonLabel: 'Share on Facebook',
                    congratulations: 'Congratulations! Your Announcement has been added!',
                    bumpingUpAndFacebookSharingBenefits: 'To reach more recipients and increase the chances of the effective lease share the Announcement on Facebook.',
                    promotionBenefits: [
                      {
                        item: 'Priority on the list',
                        explanation: 'promoted listings are presented on the list before regular ones'
                      },
                      {
                        item: 'Increased visibility on the map',
                        explanation: 'pins of promoted listings are displayed on the map above pins of regular ones'
                      },
                      {
                        item: 'Better Presentation',
                        explanation: 'promoted listings are highlighted in gold on the list and on the map'
                      },
                    ],
                    promotionBenefitsSummary: 'Greater visibility and reach',
                  },
                  
                }[lang]
              end

              def data
                {
                  announcement: ::MapawynajmuPl::Serializers::Listing::Show.new(announcement).call.merge(
                    path: announcement.url(lang),
                    title: announcement.title(lang),
                  ),
                }
              end
            end
          end
        end
      end
    end
  end
end
