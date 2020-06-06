class RemoveRentNullConstraintsFromAnnouncements < ActiveRecord::Migration[6.0]
  def change
    change_column_null :announcements, :rent_currency, true
    change_column_null :announcements, :gross_rent_amount_per_sqm, true
    change_column_null :announcements, :gross_rent_amount, true
  end
end
