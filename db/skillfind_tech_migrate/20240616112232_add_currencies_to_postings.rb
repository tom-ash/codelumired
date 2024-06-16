class AddCurrenciesToPostings < ActiveRecord::Migration[7.0]
  def change
    add_column :postings, :b2b_currency, :string, limit: 3
    add_column :postings, :employment_currency, :string, limit: 3
  end
end
