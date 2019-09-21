class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :status, null: false, limit: 2
      t.string :encrypted_search_token, null: false, unique: true
      t.string :hashed_access_token, null: false
      t.date :tokens_date, null: false
      t.jsonb :verification, null: false
      t.integer :points, null: false
      t.string :encrypted_email, null: false, unique: true
      t.string :hashed_password, null: false
      t.jsonb :consents, null: false
      t.jsonb :phone, null: false
      t.string :encrypted_business_name, null: false
      t.jsonb :showcase, null: false
      t.string :encrypted_tax_identification, null: false
      t.string :encrypted_legal_name, null: false
      t.text :encrypted_address, null: false
      t.jsonb :changelog, null: false

      t.timestamps
    end
    add_index :users, :status
    add_index :users, :encrypted_search_token
    add_index :users, :encrypted_email
  end
end
