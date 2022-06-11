class AddLangAltsGroup < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :lang_alts_group, :uuid

    add_index :pages, :lang_alts_group
  end
end
