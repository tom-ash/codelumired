class RenameConfirmedToVerified < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :confirmed_at, :email_verified_at
  end
end
