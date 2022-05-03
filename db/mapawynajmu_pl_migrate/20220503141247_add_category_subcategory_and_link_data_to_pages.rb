class AddCategorySubcategoryAndLinkDataToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :category, :string, index: true
    add_column :pages, :subcategory, :string, index: true
    add_column :pages, :link_data, :jsonb

    add_index :pages, :category
    add_index :pages, :subcategory
  end
end
