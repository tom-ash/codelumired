class CreateUserCiphers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_ciphers do |t|
      t.string :access_token_salt
      t.string :verification_code_iv
      t.integer :email_derived_cipher_id
      t.string :password_salt
      t.string :phone_body_iv
      t.string :business_name_iv
      t.string :tax_identification_iv
      t.string :invoice_data_iv

      t.timestamps
    end
  end
end
