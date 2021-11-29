# frozen_string_literal: true

module Warsawlease
  module AnnouncementModules
    module Categories
      CATEGORIES = {
        0 => {
          name: { pl: 'Biuro', en: 'Office' },
          urlified: { pl: 'biuro', en: 'office' },
          plural_urlified: { pl: 'biura', en: 'offices' }
        },
        1 => {
          name: { pl: 'Lokal użytkowy', en: 'Usable Premises' },
          urlified: { pl: 'lokal-uzytkowy', en: 'usable-premises' },
          plural_urlified: { pl: 'lokale-uzytkowe', en: 'usable-premises' }
        },
        2 => {
          name: { pl: 'Mieszkanie', en: 'Apartment' },
          urlified: { pl: 'mieszkanie', en: 'apartment' },
          plural_urlified: { pl: 'mieszkania', en: 'apartments' }
        },
        3 => {
          name: { pl: 'Dom', en: 'House' },
          urlified: { pl: 'dom', en: 'house' },
          plural_urlified: { pl: 'domy', en: 'houses' }
        },
        4 => {
          name: { pl: 'Pokój', en: 'Room' },
          urlified: { pl: 'pokoj', en: 'room' },
          plural_urlified: { pl: 'pokoje', en: 'rooms' },
        },
        5 => {
          name: { pl: 'Miejsce postojowe', en: 'Parking Space' },
          urlified: { pl: 'miejsce-postojowe', en: 'parking-space' },
          plural_urlified: { pl: 'miejsca-postojowe', en: 'parking-spaces' }
        },
        6 => {
          name: { pl: 'Biuro Wirtualne', en: 'Virtual Office' },
          urlified: { pl: 'biuro-wirtualne', en: 'virtual-office' },
          plural_urlified: { pl: 'biura-wirtualne', en: 'virtual-offices' }
        },
        7 => {
          name: { pl: 'Przestrzeń coworkingowa', en: 'Coworking Space' },
          urlified: { pl: 'przestrzen-coworkingowa', en: 'coworking-space' },
          plural_urlified: { pl: 'przestrzenie-coworkingowe', en: 'coworking-spaces' }
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
