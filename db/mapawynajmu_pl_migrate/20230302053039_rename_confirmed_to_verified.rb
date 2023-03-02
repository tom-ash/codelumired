class RenameConfirmedToVerified < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :email_confirmed_at, :email_verified_at
    remove_column :users, :confirmed

    rename_column :announcements, :confirmed, :user_verified
  end
end
