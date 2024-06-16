class AddPositionToPostings < ActiveRecord::Migration[7.0]
  def change
    add_column :postings, :position, :string, limit: 60, null: false
  end
end
