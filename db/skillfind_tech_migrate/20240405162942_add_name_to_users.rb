class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :business_name, :string

    remove_column :postings, :company_name
  end
end
