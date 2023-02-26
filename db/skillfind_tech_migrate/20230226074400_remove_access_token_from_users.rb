class RemoveAccessTokenFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :status
    remove_column :users, :encrypted_access_token
    remove_column :users, :access_token_date
    remove_column :users, :consents
    remove_column :users, :confirmed
    remove_column :users, :email_confirmed_at

    add_column :users, :confirmed_at, :datetime
  end
end
