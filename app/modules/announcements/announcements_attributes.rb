module AnnouncementsAttributes
  CREATE = %i[
    category
    district
    rent_currency
    rooms
    floor
    total_floors
    availability_date
    pictures
    features
    furnishings
    polish_description
    english_description
  ].freeze

  INDEX_FULL = %i[
    id
    category
    district
    rent_currency
    area
    net_rent_amount
    net_rent_amount_per_sqm
    gross_rent_amount
    gross_rent_amount_per_sqm
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
    min_floor
    min_total_floors
  ].freeze

  INDEX_MAXIMAL = %i[
    max_area
    max_rooms
    max_floor
    max_total_floors
  ].freeze

  INDEX_PER_PAGE = 50

  INDEX_FILTERS = [
    {
      name: 'offices',
      attribute: 'category',
      value: 0
    },
    {
      name: 'usable-premises',
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

  SHOW_FULL = %w[
    id
    user_id
    status
    visible
    category
    district
    pictures
    area
    net_rent_amount
    net_rent_amount_per_sqm
    gross_rent_amount
    gross_rent_amount_per_sqm
    rooms
    rent_currency
    floor
    total_floors
    availability_date
    features
    furnishings
    polish_description
    english_description
    longitude
    latitude
  ].freeze

  SHOW_TILE = %w[
    id
    visible
    category
    district
    pictures
    area
    net_rent_amount
    net_rent_amount_per_sqm
    gross_rent_amount
    gross_rent_amount_per_sqm
    rooms
    rent_currency
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
    gross_rent_amount
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
