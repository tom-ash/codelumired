class CreateProspectiveUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :prospective_users do |t|
      t.string :encrypted_search_token, null: false
      t.jsonb :verification, null: false
      t.jsonb :user, null: false

      t.timestamps
    end
  end
end
