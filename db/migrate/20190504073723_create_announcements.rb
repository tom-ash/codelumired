class CreateAnnouncements < ActiveRecord::Migration[5.2]
  def change
    create_table :announcements do |t|
      t.references :user, foreign_key: true
      t.boolean :active
      t.integer :points
      t.integer :views
      t.jsonb :reports
      t.date :refreshed_at
      t.integer :category
      t.integer :district
      t.integer :rent_currency
      t.integer :rent_amount
      t.boolean :additional_fees
      t.integer :area
      t.date :availability_date
      t.integer :rooms
      t.integer :floor
      t.integer :total_floors
      t.jsonb :pictures
      t.jsonb :features
      t.jsonb :furnishings
      t.text :polish_description
      t.text :english_description
      t.integer :map_longitude
      t.integer :map_latitude
      t.jsonb :history

      t.timestamps
    end
    add_index :announcements, :active
    add_index :announcements, :points
    add_index :announcements, :refreshed_at
    add_index :announcements, :category
    add_index :announcements, :district
    add_index :announcements, :rent_currency
    add_index :announcements, :rent_amount
    add_index :announcements, :additional_fees
    add_index :announcements, :area
    add_index :announcements, :availability_date
    add_index :announcements, :rooms
    add_index :announcements, :floor
    add_index :announcements, :total_floors
    add_index :announcements, :map_longitude
    add_index :announcements, :map_latitude
  end
end
