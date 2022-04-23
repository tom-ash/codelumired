class AddStorageKeyAndStorageUrlToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :storage_key, :string
    add_column :images, :storage_url, :string
  end
end
