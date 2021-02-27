class ChangeSvgsToAssets < ActiveRecord::Migration[6.0]
  def up
    rename_table :svgs, :assets

    remove_column :assets, :path_data

    add_column :assets, :type, :string
    add_column :assets, :data, :jsonb
  end

  def down
    rename_table :assets, :svgs

    add_column :svgs, :path_data, :string, null: false

    remove_column :svgs, :type, :string
    remove_column :svgs, :data, :jsonb
  end
end
