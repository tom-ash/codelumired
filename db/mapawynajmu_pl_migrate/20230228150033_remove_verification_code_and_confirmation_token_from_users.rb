class RemoveVerificationCodeAndConfirmationTokenFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :verification
    remove_column :users, :verification_code_iv
    remove_column :users, :encrypted_confirmation_token
    remove_column :users, :confirmation_token_generated_at
  end
end
