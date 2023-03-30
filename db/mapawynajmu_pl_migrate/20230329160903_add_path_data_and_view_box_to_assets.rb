class AddPathDataAndViewBoxToAssets < ActiveRecord::Migration[6.1]
  def change
    add_column :assets, :path_data, :string
    add_column :assets, :view_box, :string
  end
end
