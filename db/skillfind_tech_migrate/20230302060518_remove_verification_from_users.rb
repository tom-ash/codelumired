class RemoveVerificationFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :verification
    remove_column :users, :verification_code_iv
  end
end
