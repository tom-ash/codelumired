class AddConfirmedToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :confirmed, :boolean, null: false, default: false
    add_index :users, :confirmed
    add_column :users, :email_confirmed_at, :datetime
    add_index :users, :email_confirmed_at
    add_column :announcements, :confirmed, :boolean
    add_index :announcements, :confirmed
    drop_table :prospective_users
  end

  def down
    remove_column :users, :confirmed
    remove_column :users, :email_confirmed_at
    remove_column :announcements, :confirmed

    create_table :prospective_users do |t|
      t.string :encrypted_access_token, null: false
      t.jsonb :verification, null: false
      t.string :verification_code_iv, null: false
      t.jsonb :user, null: false

      t.timestamps
    end
    add_index :prospective_users, :encrypted_access_token, unique: true
  end
end
