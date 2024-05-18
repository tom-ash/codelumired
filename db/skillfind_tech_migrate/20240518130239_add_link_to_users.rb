class AddLinkToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :link, :string, limit: 2000
  end
end
