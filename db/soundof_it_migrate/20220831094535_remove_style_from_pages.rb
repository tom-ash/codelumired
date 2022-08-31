class RemoveStyleFromPages < ActiveRecord::Migration[6.1]
  def change
    remove_column :pages, :style
  end
end
