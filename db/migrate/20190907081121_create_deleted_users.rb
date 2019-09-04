class CreateDeletedUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :deleted_users do |t|
      t.jsonb :original_user, null: false

      t.timestamps
    end
  end
end
