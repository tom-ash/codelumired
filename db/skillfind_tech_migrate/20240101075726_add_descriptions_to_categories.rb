class AddDescriptionsToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :description_en, :string
    add_column :categories, :description_pl, :string
  end
end
