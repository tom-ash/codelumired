class AddAuthorToPages < ActiveRecord::Migration[6.1]
  def up
    add_reference :pages, :author, foreign_key: { to_table: :users }
  end

  def down
    remove_reference :pages, :author
  end
end
