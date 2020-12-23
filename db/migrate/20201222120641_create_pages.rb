class CreatePages < ActiveRecord::Migration[6.0]
  def up
    drop_table :posts

    create_table :pages do |t|
      t.belongs_to :author, foreign_key: { to_table: :users }, null: false
      t.string :language, null: false, index: true
      t.string :name, null: false, index: true
      t.string :url, null: false, index: { unique: true }
      t.string :title, index: true
      t.string :title_tag
      t.string :keywords, index: true
      t.string :description, index: true
      t.string :style
      t.jsonb :body, null: false
      t.jsonb :meta

      t.timestamps
    end

    add_index :pages, %i[name language], unique: true
  end

  def down
    drop_table :pages

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
end
