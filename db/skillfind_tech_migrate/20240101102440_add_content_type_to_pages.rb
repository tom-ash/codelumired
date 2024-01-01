class AddContentTypeToPages < ActiveRecord::Migration[7.0]
  def change
    add_column :pages, :content_type, :string
  end
end
