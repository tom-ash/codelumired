class ChangeIDtoUuiDinPages < ActiveRecord::Migration[6.1]
  def up
    enable_extension 'pgcrypto'

    add_column :pages, :uuid, :uuid, default: 'gen_random_uuid()', null: false

    change_table :pages do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute 'ALTER TABLE pages ADD PRIMARY KEY (id);'
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
