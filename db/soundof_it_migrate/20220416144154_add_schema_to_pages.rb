class AddSchemaToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :schema_mode, :string, default: 'auto', null: false
    add_column :pages, :auto_schema, :jsonb, default: {}, null: false
    add_column :pages, :manual_schema, :jsonb, default: {}, null: false
  end
end
