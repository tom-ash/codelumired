class ChangePosts < ActiveRecord::Migration[6.0]
  def up
    drop_table :posts

    create_table :posts do |t|
      t.belongs_to :author, foreign_key: { to_table: :users }, null: false
      t.string :name, null: false, index: true
      t.string :language, null: false, index: true
      t.jsonb :meta
      t.jsonb :url, index: true
      t.jsonb :title, null: false, index: true
      t.jsonb :body, null: false

      t.timestamps
    end

    add_index :posts, %i[name language], unique: true
  end

  def down
    drop_table :posts

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
