class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.belongs_to :added_by, foreign_key: { to_table: :users }, null: false
      t.belongs_to :page
      t.jsonb :body, null: false

      t.timestamps
    end
  end
end
