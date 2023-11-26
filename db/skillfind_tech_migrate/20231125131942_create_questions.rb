class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions, :id => :uuid do |t|
      t.string :lang, null: false
      t.string :url, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.jsonb :hint, null: false
      t.string :explanation, null: false

      t.timestamps
    end

    add_index :questions, :url, unique: true
  end
end
