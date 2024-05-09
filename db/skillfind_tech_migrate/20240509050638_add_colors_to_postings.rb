class AddColorsToPostings < ActiveRecord::Migration[7.0]
  def change
    add_column :postings, :background_color, :string, limit: 7, null: false
    add_column :postings, :text_color, :string, limit: 7, null: false
  end
end
