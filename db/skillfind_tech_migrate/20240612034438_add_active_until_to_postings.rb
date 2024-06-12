class AddActiveUntilToPostings < ActiveRecord::Migration[7.0]
  def change
    add_column :postings, :active_until, :datetime
  end
end
