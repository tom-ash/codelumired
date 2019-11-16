module AnnouncementsAttributes
  CREATE = %i[
    category
    district
    rent_currency
    additional_fees
    rooms
    floor
    total_floors
    availability_date
    pictures
    features
    furnishings
    polish_description
    english_description
    longitude
    latitude
  ].freeze

  INDEX_FULL = %i[
    id
    category
    district
    net_rent_amount
    rent_currency
    area
    pictures
    rooms
    floor
    total_floors
    availability_date
    latitude
    longitude
  ].freeze

  INDEX_EQUAL = %i[
    category
    district
    rent_currency
  ].freeze

  INDEX_MINIMAL = %i[
    min_area
    min_rooms
    min_net_rent_amount
    min_floor
    min_total_floors
  ].freeze

  INDEX_MAXIMAL = %i[
    max_area
    max_rooms
    max_net_rent
    amount
    max_floor
    max_total_floors
    availability_date
  ].freeze

  INDEX_PER_PAGE = 50

  INDEX_FILTERS = [
    {
      name: 'offices',
      attribute: 'category',
      value: 0
    },
    {
      name: 'usablePremises',
      attribute: 'category',
      value: 1
    },
    {
      name: 'visible',
      attribute: 'visible',
      value: true
    },
    {
      name: 'hidden',
      attribute: 'visible',
      value: false
    }
  ].freeze

  INDEX_SORTERS = {
    updateasc: 'updated_at',
    updatedesc: 'updated_at DESC',
    createasc: 'created_at',
    createdesc: 'created_at DESC',
    viewsasc: 'views',
    viewsdesc: 'views DESC'
  }.freeze.with_indifferent_access

  SHOW_FULL = %i[
    id
    user_id
    status
    visible
    category
    district
    pictures
    area
    rooms
    net_rent_amount
    net_rent_amount_per_sqm
    gross_rent_amount
    gross_rent_amount_per_sqm
    rent_currency
    additional_fees
    floor
    total_floors
    availability_date
    features
    furnishings
    polish_description
    english_description
    latitude
    longitude
  ].freeze

  SHOW_TILE = %i[
    id
    visible
    category
    district
    pictures
    area
    rooms
    net_rent_amount
    net_rent_amount_per_sqm
    gross_rent_amount
    gross_rent_amount_per_sqm
    rent_currency
    additional_fees
    floor
    total_floors
    availability_date
  ].freeze

  EDIT = %i[
    id
    user_id
    category
    district
    pictures
    area
    rooms
    rent_currency
    net_rent_amount
    additional_fees
    availability_date
    floor
    total_floors
    features
    furnishings
    polish_description
    english_description
    latitude
    longitude
  ].freeze

  UPDATE = %i[
    visible
    category
    district
    area
    rent_currency
    additional_fees
    rooms
    floor
    total_floors
    pictures
    availability_date
    features
    furnishings
    polish_description
    english_description
    latitude
    longitude
  ].freeze
end
