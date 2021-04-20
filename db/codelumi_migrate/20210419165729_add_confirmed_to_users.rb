class AddConfirmedToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :confirmed, :boolean, null: false, default: false
    add_index :users, :confirmed
    add_column :users, :email_confirmed_at, :datetime
    add_index :users, :email_confirmed_at
  end

  def down
    remove_column :users, :confirmed
    remove_column :users, :email_confirmed_at
  end
end
