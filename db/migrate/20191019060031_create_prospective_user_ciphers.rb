class CreateProspectiveUserCiphers < ActiveRecord::Migration[6.0]
  def change
    create_table :prospective_user_ciphers do |t|
      t.string :verification_code_iv, null: false
      t.jsonb :user_cipher, null: false

      t.timestamps
    end
  end
end
