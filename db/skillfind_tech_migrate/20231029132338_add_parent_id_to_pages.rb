class AddParentIdToPages < ActiveRecord::Migration[7.0]
  def change
    add_reference :pages, :parent, type: :uuid, foreign_key: { to_table: :pages }
  end
end
