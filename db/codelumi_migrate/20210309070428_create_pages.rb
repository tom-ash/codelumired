class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :name, null: false, index: true
      t.string :lang, null: false, index: true
      t.string :url, null: false, index: { unique: true }
      t.string :canonical_url
      t.jsonb :body, null: false
      t.string :styles
      t.string :title, index: true
      t.string :keywords, index: true
      t.string :description, index: true
      t.string :picture
      t.string :style
      t.jsonb :meta

      t.timestamps
    end
  end
end
