class AddUniqueIndexOnStorageKeyToImages < ActiveRecord::Migration[6.1]
  def change
    add_index :images, :storage_key, unique: true
    change_column_null :images, :storage_key, false
  end
end
