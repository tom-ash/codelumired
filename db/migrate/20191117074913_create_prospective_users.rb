class CreateProspectiveUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :prospective_users do |t|
      t.string :encrypted_access_token, null: false
      t.jsonb :verification, null: false
      t.string :verification_code_iv, null: false
      t.jsonb :user, null: false

      t.timestamps
    end
    add_index :prospective_users, :encrypted_access_token, unique: true
  end
end
