class RemoveNameFromPages < ActiveRecord::Migration[6.1]
  def change
    remove_column :pages, :name
  end
end
