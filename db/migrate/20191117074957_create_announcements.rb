class CreateAnnouncements < ActiveRecord::Migration[6.0]
  def change
    create_table :announcements do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :status, null: false, limit: 2
      t.integer :distinct, null: false, limit: 2
      t.integer :points, null: false
      t.integer :views, null: false
      t.jsonb :reports, null: false
      t.boolean :visible, null: false
      t.date :active_until, null: false
      t.integer :category, null: false, limit: 2
      t.integer :district, null: false, limit: 2
      t.integer :area, null: false
      t.integer :rent_currency, null: false, limit: 2
      t.integer :net_rent_amount, null: false
      t.integer :net_rent_amount_per_sqm, null: false
      t.integer :gross_rent_amount, null: false
      t.integer :gross_rent_amount_per_sqm, null: false
      t.integer :rooms, null: false, limit: 2
      t.integer :floor, null: false, limit: 2
      t.integer :total_floors, null: false, limit: 2
      t.date :availability_date, null: false
      t.jsonb :pictures, null: false
      t.jsonb :features, null: false
      t.jsonb :furnishings, null: false
      t.text :polish_description, null: false
      t.text :english_description, null: false
      t.integer :longitude, null: false
      t.integer :latitude, null: false
      t.jsonb :changes_log, null: false

      t.timestamps
    end
    add_index :announcements, :status
    add_index :announcements, :distinct
    add_index :announcements, :points
    add_index :announcements, :visible
    add_index :announcements, :active_until
    add_index :announcements, :category
    add_index :announcements, :district
    add_index :announcements, :area
    add_index :announcements, :rent_currency
    add_index :announcements, :net_rent_amount
    add_index :announcements, :net_rent_amount_per_sqm
    add_index :announcements, :gross_rent_amount
    add_index :announcements, :gross_rent_amount_per_sqm
    add_index :announcements, :rooms
    add_index :announcements, :floor
    add_index :announcements, :total_floors
    add_index :announcements, :availability_date
    add_index :announcements, :longitude
    add_index :announcements, :latitude
  end
end
