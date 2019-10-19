class CreateProspectiveUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :prospective_users do |t|
      t.string :encrypted_token, null: false
      t.jsonb :verification, null: false
      t.jsonb :user, null: false

      t.timestamps
    end
    add_index :prospective_users, :encrypted_token, unique: true
  end
end
