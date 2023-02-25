class AddNameWidthAndHeightToImages < ActiveRecord::Migration[6.1]
  def change
    add_column :images, :name, :string
    add_column :images, :width, :integer
    add_column :images, :height, :integer
  end
end
