class RemoveColorsFromPostings < ActiveRecord::Migration[7.0]
  def change
    remove_column :postings, :background_color
    remove_column :postings, :text_color
  end
end
