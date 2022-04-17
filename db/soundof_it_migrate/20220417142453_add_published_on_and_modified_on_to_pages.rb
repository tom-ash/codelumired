class AddPublishedOnAndModifiedOnToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :published_on, :date
    add_column :pages, :modified_on, :date
  end
end
