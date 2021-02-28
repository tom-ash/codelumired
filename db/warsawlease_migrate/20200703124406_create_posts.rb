class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :author, null: false, index: true, foreign_key: { to_table: :users }
      t.string :name, null: false, index: { unique: true }
      t.jsonb :meta
      t.jsonb :url, index: { unique: true }
      t.jsonb :title, null: false, index: { unique: true }
      t.jsonb :body, null: false

      t.timestamps
    end
  end
end
