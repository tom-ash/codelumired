class AddLatAndLngToPostings < ActiveRecord::Migration[7.0]
  def change
    add_column :postings, :lat, :float, null: false
    add_column :postings, :lng, :float, null: false
    add_column :postings, :place_autocomplete, :string, null: false
    add_column :postings, :place_id, :string, null: false

    add_index :postings, :lat
    add_index :postings, :lng
  end
end
