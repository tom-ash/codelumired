class ChangeSvgsToAssets < ActiveRecord::Migration[6.0]
  def change
    rename_table :svgs, :assets

    add_column :assets, :type, :string
    add_column :assets, :data, :jsonb
  end
end
