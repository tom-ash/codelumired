class AddIndustryToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :industry, :string
    add_index :users, :industry

    remove_column :postings, :industry
  end
end
