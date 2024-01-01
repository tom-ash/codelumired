class RemoveCategoryFromPages < ActiveRecord::Migration[7.0]
  def change
    remove_column :pages, :category
    remove_column :pages, :subcategory
  end
end
