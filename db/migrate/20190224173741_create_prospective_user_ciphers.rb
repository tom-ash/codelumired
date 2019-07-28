class CreateProspectiveUserCiphers < ActiveRecord::Migration[5.2]
  def change
    create_table :prospective_user_ciphers do |t|
      t.string :verification_code_iv
      t.jsonb :user_cipher

      t.timestamps
    end
  end
end
