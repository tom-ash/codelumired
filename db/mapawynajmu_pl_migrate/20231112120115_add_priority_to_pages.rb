class AddPriorityToPages < ActiveRecord::Migration[7.0]
  def change
    add_column :pages, :priority, :int2, limit: 2
  end
end
