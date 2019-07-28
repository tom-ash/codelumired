class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :status
      t.string :encrypted_search_token
      t.string :hashed_access_token
      t.jsonb :verification
      t.string :encrypted_email
      t.string :hashed_password
      t.jsonb :consents
      t.integer :points
      t.jsonb :phone
      t.string :encrypted_business_name
      t.string :encrypted_tax_identification
      t.jsonb :showcase
      t.text :encrypted_invoice_data
      t.jsonb :history

      t.timestamps
    end
    add_index :users, :encrypted_search_token
    add_index :users, :encrypted_email
  end
end
