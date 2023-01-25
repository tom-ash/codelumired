# frozen_string_literal: true

module MapawynajmuPl
  module AnnouncementModules
    module Categories
      CATEGORIES = {
        0 => {
          name: {
            pl: 'Biuro',
            en: 'Office',
          },
          name_plural: {
            pl: 'Biura',
            en: 'Offices',
          },
          urlified: {
            pl: 'biuro',
            en: 'office',
          },
          urlified_plural: {
            pl: 'biura',
            en: 'offices',
          },
          trackified: 'offices',
        },
        1 => {
          name: {
            pl: 'Lokal użytkowy',
            en: 'Usable Premises',
          },
          name_plural: {
            pl: 'Lokale użytkowe',
            en: 'Usable Premises',
          },
          urlified: {
            pl: 'lokal-uzytkowy',
            en: 'usable-premises',
          },
          urlified_plural: {
            pl: 'lokale-uzytkowe',
            en: 'usable-premises',
          },
          trackified: 'usable_premises',
        },
        2 => {
          name: {
            pl: 'Mieszkanie',
            en: 'Apartment',
          },
          name_plural: {
            pl: 'Mieszkania',
            en: 'Apartments',
          },
          urlified: {
            pl: 'mieszkanie',
            en: 'apartment',
          },
          urlified_plural: {
            pl: 'mieszkania',
            en: 'apartments',
          },
          trackified: 'apartments',
        },
        3 => {
          name: {
            pl: 'Dom',
            en: 'House',
          },
          name_plural: {
            pl: 'Domy',
            en: 'Houses',
          },
          urlified: {
            pl: 'dom',
            en: 'house',
          },
          urlified_plural: {
            pl: 'domy',
            en: 'houses',
          },
          trackified: 'houses',
        },
        4 => {
          name: {
            pl: 'Pokój',
            en: 'Room',
          },
          name_plural: {
            pl: 'Pokoje',
            en: 'Rooms',
          },
          urlified: {
            pl: 'pokoj',
            en: 'room',
          },
          urlified_plural: {
            pl: 'pokoje',
            en: 'rooms',
          },
          trackified: 'rooms',
        },
        5 => {
          name: {
            pl: 'Miejsce parkingowe',
            en: 'Parking Space',
          },
          name_plural: {
            pl: 'Miejsca parkingowe',
            en: 'Parking Spaces',
          },
          urlified: {
            pl: 'miejsce-parkingowe',
            en: 'parking-space',
          },
          urlified_plural: {
            pl: 'miejsca-parkingowe',
            en: 'parking-spaces',
          },
          trackified: 'parking_spaces',
        },
        6 => {
          name: {
            pl: 'Biuro Wirtualne',
            en: 'Virtual Office',
          },
          name_plural: {
            pl: 'Biura Wirtualne',
            en: 'Virtual Offices',
          },
          urlified: {
            pl: 'biuro-wirtualne',
            en: 'virtual-office',
          },
          urlified_plural: {
            pl: 'biura-wirtualne',
            en: 'virtual-offices',
          },
          trackified: 'virtual_offices',
        },
        7 => {
          name: {
            pl: 'Coworking - Przestrzeń coworkingowa',
            en: 'Coworking Spaces',
          },
          name_plural: {
            pl: 'Coworking - Przestrzenie coworkingowe',
            en: 'Coworking Spaces',
          },
          urlified: {
            pl: 'coworking-przestrzen-coworkingowa',
            en: 'coworking-space',
          },
          urlified_plural: {
            pl: 'coworking-przestrzenie-coworkingowe',
            en: 'coworking-spaces',
          },
          trackified: 'coworking_spaces',
        },
        8 => {
          name: {
            pl: 'Przestrzeń reklamowa',
            en: 'Advertising Space',
          },
          name_plural: {
            pl: 'Przestrzenie reklamowe',
            en: 'Advertising Spaces',
          },
          urlified: {
            pl: 'przestrzen-reklamowa',
            en: 'advertising-space',
          },
          urlified_plural: {
            pl: 'przestrzenie-reklamowe',
            en: 'advertising-spaces',
          },
          trackified: 'advertising_spaces',
        },
        9 => {
          name: {
            pl: 'Garaż',
            en: 'Garage',
          },
          name_plural: {
            pl: 'Garaże',
            en: 'Garages',
          },
          urlified: {
            pl: 'garaz',
            en: 'garage',
          },
          urlified_plural: {
            pl: 'garaze',
            en: 'garages',
          },
          trackified: 'garages',
        },
      }.freeze

      URL_CATEGORIES = begin
        categories = []
        CATEGORIES.each_value do |category|
          categories += [category[:urlified_plural][:pl], category[:urlified_plural][:en]]
        end
        categories.join('|')
      end
    end
  end
end
