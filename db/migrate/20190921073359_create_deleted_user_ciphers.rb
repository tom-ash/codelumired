class CreateDeletedUserCiphers < ActiveRecord::Migration[5.2]
  def change
    create_table :deleted_user_ciphers do |t|
      t.jsonb :original_user_cipher

      t.timestamps
    end
  end
end
