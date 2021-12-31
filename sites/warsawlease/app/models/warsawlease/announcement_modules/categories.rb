# frozen_string_literal: true

module MapawynajmuPl
  module AnnouncementModules
    module Categories
      CATEGORIES = {
        0 => {
          name: { pl: 'Biuro', en: 'Office' },
          plural_name: { pl: 'Biura', en: 'Offices' },
          urlified: { pl: 'biuro', en: 'office' },
          plural_urlified: { pl: 'biura', en: 'offices' },
          trackified: 'offices'
        },
        1 => {
          name: { pl: 'Lokal użytkowy', en: 'Usable Premises' },
          plural_name: { pl: 'Lokale użytkowe', en: 'Usable Premises' },
          urlified: { pl: 'lokal-uzytkowy', en: 'usable-premises' },
          plural_urlified: { pl: 'lokale-uzytkowe', en: 'usable-premises' },
          trackified: 'usable_premises'
        },
        2 => {
          name: { pl: 'Mieszkanie', en: 'Apartment' },
          plural_name: { pl: 'Mieszkania', en: 'Apartments' },
          urlified: { pl: 'mieszkanie', en: 'apartment' },
          plural_urlified: { pl: 'mieszkania', en: 'apartments' },
          trackified: 'apartments'
        },
        3 => {
          name: { pl: 'Dom', en: 'House' },
          plural_name: { pl: 'Domy', en: 'Houses' },
          urlified: { pl: 'dom', en: 'house' },
          plural_urlified: { pl: 'domy', en: 'houses' },
          trackified: 'houses'
        },
        4 => {
          name: { pl: 'Pokój', en: 'Room' },
          plural_name: { pl: 'Pokoje', en: 'Rooms' },
          urlified: { pl: 'pokoj', en: 'room' },
          plural_urlified: { pl: 'pokoje', en: 'rooms' },
          trackified: 'rooms'
        },
        5 => {
          name: { pl: 'Miejsce parkingowe', en: 'Parking Space' },
          plural_name: { pl: 'Miejsca parkingowe', en: 'Parking Spaces' },
          urlified: { pl: 'miejsce-parkingowe', en: 'parking-space' },
          plural_urlified: { pl: 'miejsca-parkingowe', en: 'parking-spaces' },
          trackified: 'parking_spaces'
        },
        6 => {
          name: { pl: 'Biuro Wirtualne', en: 'Virtual Office' },
          plural_name: { pl: 'Biura Wirtualne', en: 'Virtual Offices' },
          urlified: { pl: 'biuro-wirtualne', en: 'virtual-office' },
          plural_urlified: { pl: 'biura-wirtualne', en: 'virtual-offices' },
          trackified: 'virtual_offices'
        },
        7 => {
          name: { pl: 'Przestrzeń coworkingowa', en: 'Coworking Spaces' },
          plural_name: { pl: 'Przestrzenie coworkingowa', en: 'Coworking Spaces' },
          urlified: { pl: 'przestrzen-coworkingowa', en: 'coworking-space' },
          plural_urlified: { pl: 'przestrzenie-coworkingowe', en: 'coworking-spaces' },
          trackified: 'coworking_spaces'
        }
      }.freeze

      URL_CATEGORIES = begin
        categories = []
        CATEGORIES.each_value do |category|
          categories += [category[:plural_urlified][:pl], category[:plural_urlified][:en]]
        end
        categories.join('|')
      end
    end
  end
end
