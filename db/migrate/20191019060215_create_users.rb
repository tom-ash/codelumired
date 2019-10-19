class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :status, null: false, limit: 2
      t.string :encrypted_token, null: false
      t.date :token_date, null: false
      t.jsonb :verification, null: false
      t.integer :points, null: false
      t.string :encrypted_email, null: false
      t.string :hashed_password, null: false
      t.jsonb :consents, null: false
      t.jsonb :phone, null: false
      t.string :encrypted_business_name, null: false
      t.jsonb :showcase, null: false
      t.string :encrypted_tax_identification, null: false
      t.string :encrypted_legal_name, null: false
      t.text :encrypted_address, null: false
      t.jsonb :past_log, null: false

      t.timestamps
    end
    add_index :users, :status
    add_index :users, :encrypted_token, unique: true
    add_index :users, :encrypted_email, unique: true
  end
end
