# frozen_string_literal: true

module MapawynajmuPl
  module Api
    module Tracks
      module Root
        class Appender < ::MapawynajmuPl::Api::Tracks::Common::Appender
          include ::MapawynajmuPl::Api::Tracks::Root::Assets
          include ::MapawynajmuPl::Api::Tracks::Root::Meta
          include ::MapawynajmuPl::Api::Tracks::Helpers::Announcements
          include ::MapawynajmuPl::Api::Tracks::Helpers::Filters

          private

          # def control
          #   {
          #     showCategoryTiles: true,
          #   }
          # end

          def control
            {
              showCategoryTiles: false,
              isMapInitialized: false,
              shouldInitializeMap: false,
              isPinsDrawn: false,
              mapOptions: {
                center: {
                  lat: 52,
                  lng: 19,
                },
                zoom: 6.7,
              },
            }
          end

          def data
            data_hash = {
              current_category: current_category,
              current_partner_name: current_partner&.business_name,
              title: title,
              tile: nil,
              announcements: serialized_announcements,
              amount: serialized_announcements.count,
            }

            # if ssr? || attrs[:listings_obsolete]
            #   data_hash.merge!(
            #     announcements: serialized_announcements,
            #     amount: serialized_announcements.count,
            #   )
            # end

            data_hash
          end

          def texts
            {
              pl: {
                categoryInputPlaceholder: 'Kategoria',
                apartmentsCategoryLabel: 'Mieszkania',
                roomsCategoryLabel: 'Pokoje',
                housesCategoryLabel: 'Domy',
                parkingSpacesCategoryLabel: 'Miejsca parkingowe',
                garageCategoryLabel: 'Garaże',
                usablePremisesCategoryLabel: 'Lokale użytkowe',
                officesCategoryLabel: 'Biura',
                virtualOfficesCategoryLabel: 'Biura wirtualne',
                coworkingCategoryLabel: 'Coworking',
                advertisingSpacesCategoryLabel: 'Przestrzenie reklamowe',
              },
              en: {
                categoryInputPlaceholder: 'Category',
                apartmentsCategoryLabel: 'Mieszkania',
                roomsCategoryLabel: '',
                housesCategoryLabel: '',
                parkingSpacesCategoryLabel: '',
                garageCategoryLabel: '',
                usablePremisesCategoryLabel: '',
                officesCategoryLabel: '',
                virtualOfficesCategoryLabel: '',
                coworkingCategoryLabel: '',
                advertisingSpacesCategoryLabel: '',
              },
            }[lang]
          end


        end
      end
    end
  end
end
