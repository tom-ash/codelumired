class RemoveStylesFromPages < ActiveRecord::Migration[6.1]
  def change
    remove_column :pages, :styles
  end
end
