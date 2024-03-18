class AddIndustryToPostings < ActiveRecord::Migration[7.0]
  def change
    add_column :postings, :industry, :string, null: false

    add_index :postings, :industry
  end
end
