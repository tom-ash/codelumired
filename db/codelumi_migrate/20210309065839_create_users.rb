class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :status, null: false, limit: 2
      t.string :email, null: false
      t.string :role
      t.string :account_type
      t.string :first_name
      t.string :last_name
      t.string :encrypted_access_token, null: false
      t.date :access_token_date, null: false
      t.jsonb :verification
      t.string :verification_code_iv
      t.string :hashed_password, null: false
      t.string :password_salt, null: false
      t.jsonb :consents, null: false
      t.jsonb :change_log, null: false

      t.timestamps
    end
  end
end
