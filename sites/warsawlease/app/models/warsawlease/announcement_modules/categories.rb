# frozen_string_literal: true

module Warsawlease
  module AnnouncementModules
    module Categories
      CATEGORIES = {
        0 => {
          name: { pl: 'Biuro', en: 'Office' },
          urlified: { pl: 'biuro', en: 'office' }
        },
        1 => {
          name: { pl: 'Lokal użytkowy', en: 'Usable Premises' },
          urlified: { pl: 'lokal-uzytkowy', en: 'usable-premises' }
        },
        2 => {
          name: { pl: 'Mieszkanie', en: 'Apartment' },
          urlified: { pl: 'mieszkanie', en: 'apartment' }
        },
        3 => {
          name: { pl: 'Dom', en: 'House' },
          urlified: { pl: 'dom', en: 'house' }
        },
        4 => {
          name: { pl: 'Pokój', en: 'Room' },
          urlified: { pl: 'pokoj', en: 'room' }
        },
        5 => {
          name: { pl: 'Miejsce postojowe', en: 'Parking Space' },
          urlified: { pl: 'miejsce-postojowe', en: 'parking-space' }
        },
        6 => {
          name: { pl: 'Biuro Wirtualne', en: 'Virtual Office' },
          urlified: { pl: 'biuro-wirtualne', en: 'virtual-office' }
        },
        7 => {
          name: { pl: 'Przestrzeń coworkingowa', en: 'Coworking Space' },
          urlified: { pl: 'przestrzen-coworkingowa', en: 'coworking-space' }
        }
      }.freeze
    end
  end
end
