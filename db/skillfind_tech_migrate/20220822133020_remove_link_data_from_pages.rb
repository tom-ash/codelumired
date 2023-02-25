class RemoveLinkDataFromPages < ActiveRecord::Migration[6.1]
  def change
    remove_column :pages, :link_data
  end
end
