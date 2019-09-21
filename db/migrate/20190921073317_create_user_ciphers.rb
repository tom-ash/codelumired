class CreateUserCiphers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_ciphers do |t|
      t.string :access_token_salt, null: false
      t.string :verification_code_iv, null: false
      t.integer :email_derived_cipher_id, null: false
      t.string :password_salt, null: false
      t.string :phone_body_iv, null: false
      t.string :business_name_iv, null: false
      t.string :tax_identification_iv, null: false
      t.string :legal_name_iv, null: false
      t.string :address_iv, null: false
      t.jsonb :changelog, null: false

      t.timestamps
    end
  end
end
