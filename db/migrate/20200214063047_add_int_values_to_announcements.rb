class AddIntValuesToAnnouncements < ActiveRecord::Migration[6.0]
  def change
    add_column :announcements, :area_int, :integer
    add_column :announcements, :net_rent_amount_int, :integer
    add_column :announcements, :net_rent_amount_per_sqm_int, :integer
    add_column :announcements, :gross_rent_amount_int, :integer
    add_column :announcements, :gross_rent_amount_per_sqm_int, :integer
    add_column :announcements, :longitude_int, :integer
    add_column :announcements, :latitude_int, :integer
    change_column :announcements, :area, :float, null: false
    change_column :announcements, :net_rent_amount, :float
    change_column :announcements, :net_rent_amount_per_sqm, :float
    change_column :announcements, :gross_rent_amount, :float, null: false
    change_column :announcements, :gross_rent_amount_per_sqm, :float, null: false
    change_column :announcements, :longitude, :float, null: false
    change_column :announcements, :latitude, :float, null: false
    add_index :announcements, :area_int
    add_index :announcements, :net_rent_amount_int
    add_index :announcements, :net_rent_amount_per_sqm_int
    add_index :announcements, :gross_rent_amount_int
    add_index :announcements, :gross_rent_amount_per_sqm_int
    add_index :announcements, :longitude_int
    add_index :announcements, :latitude_int
  end
end
