class AddEncryptedConfirmationTokenToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :encrypted_confirmation_token, :string
    add_column :users, :confirmation_token_generated_at, :datetime, precision: 6

    add_index :users, :encrypted_confirmation_token
  end
end
