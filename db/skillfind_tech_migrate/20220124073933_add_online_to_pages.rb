class AddOnlineToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :online, :boolean
  end
end
