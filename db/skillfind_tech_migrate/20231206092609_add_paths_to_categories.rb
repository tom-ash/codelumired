class AddPathsToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :path_en, :string
    add_column :categories, :path_pl, :string
  end
end
