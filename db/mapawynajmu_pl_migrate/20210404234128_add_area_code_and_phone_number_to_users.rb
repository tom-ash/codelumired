class AddAreaCodeAndPhoneNumberToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :country_code, :string, index: true
    add_column :users, :phone_number, :string, index: true

    add_index :users, :country_code
    add_index :users, :phone_number
  end
end
