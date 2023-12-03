class AddCategoryToPages < ActiveRecord::Migration[7.0]
  def change
    add_reference :pages, :category, type: :uuid, foreign_key: { to_table: :categories }
  end
end
