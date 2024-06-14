class AddConsentsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :consents, :jsonb
  end
end
