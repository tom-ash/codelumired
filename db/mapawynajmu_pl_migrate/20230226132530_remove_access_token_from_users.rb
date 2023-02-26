class RemoveAccessTokenFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :encrypted_access_token
    remove_column :users, :access_token_date
  end
end
