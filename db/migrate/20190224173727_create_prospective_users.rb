class CreateProspectiveUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :prospective_users do |t|
      t.string :encrypted_search_token
      t.jsonb :verification
      t.jsonb :user

      t.timestamps
    end
  end
end
