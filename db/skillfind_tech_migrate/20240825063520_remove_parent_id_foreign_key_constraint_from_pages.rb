class RemoveParentIdForeignKeyConstraintFromPages < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :pages, to_table: :pages
  end
end
