class AddAuthorDataToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :author_data, :jsonb
  end
end
