class AddUrlifiedBusinessNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :urlified_business_name, :string
  end
end
