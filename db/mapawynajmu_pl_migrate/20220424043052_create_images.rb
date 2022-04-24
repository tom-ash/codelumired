class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.belongs_to :added_by, foreign_key: { to_table: :users }, null: false
      t.belongs_to :page
      t.jsonb :body, null: false
      t.string :name
      t.integer :width
      t.integer :height
      t.string :storage_key, null: false, index: { unique: true }
      t.string :storage_url

      t.timestamps
    end
  end
end
