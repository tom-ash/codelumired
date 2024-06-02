class AddDeletedAtToPostings < ActiveRecord::Migration[7.0]
  def change
    add_column :postings, :deleted_at, :datetime
  end
end
