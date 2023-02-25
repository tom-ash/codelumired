class AddHeaderAutonumberingToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :header_autonumbering, :boolean
  end
end
