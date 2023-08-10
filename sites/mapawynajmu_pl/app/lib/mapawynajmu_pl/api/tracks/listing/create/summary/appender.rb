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
                    promoteButtonLabel: 'Wyróżnij ogłoszenie za 19 PLN',
                    facebookSharerButtonLabel: 'Udostępnij na Facebook\'u',
                    congratulations: 'Gratulacje! Twoje ogłoszenie zostało dodane!',
                    bumpingUpAndFacebookSharingBenefits: 'Wyróżniając ogłoszenie i udostępniając na Facebook\'u zwiększasz szansę na skuteczny wynajem.',
                  },
                  en: {
                    promoteButtonLabel: 'Promote listing for 19 PLN',
                    facebookSharerButtonLabel: 'Share on Facebook',
                    congratulations: 'Congratulations! Your Announcement has been added!',
                    bumpingUpAndFacebookSharingBenefits: 'To reach more recipients and increase the chances of the effective lease share the Announcement on Facebook.',
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
