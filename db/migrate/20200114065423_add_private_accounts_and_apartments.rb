class AddPrivateAccountsAndApartments < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :account_type, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    change_column_null(:users, :business_name, true)
    change_column_null(:users, :legal_name, true)
    change_column_null(:users, :tax_number, true)
    change_column_null(:users, :address, true)

    change_column_null(:announcements, :net_rent_amount, true)
    change_column_null(:announcements, :net_rent_amount_per_sqm, true)
  end
end
