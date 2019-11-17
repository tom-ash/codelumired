class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :status, null: false, limit: 2
      t.string :encrypted_access_token, null: false
      t.date :access_token_date, null: false
      t.jsonb :verification
      t.string :verification_code_iv
      t.integer :points, null: false
      t.string :email, null: false
      t.string :hashed_password, null: false
      t.string :password_salt, null: false
      t.jsonb :consents, null: false
      t.jsonb :phone, null: false
      t.string :business_name, null: false
      t.jsonb :showcase, null: false
      t.string :legal_name, null: false
      t.string :tax_number, null: false
      t.text :address, null: false
      t.jsonb :changes_log, null: false

      t.timestamps
    end
    add_index :users, :status
    add_index :users, :encrypted_access_token, unique: true
    add_index :users, :email, unique: true
  end
end
