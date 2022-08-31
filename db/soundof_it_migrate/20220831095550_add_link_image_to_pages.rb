class AddLinkImageToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :link_image, :string

    rename_column :pages, :picture, :cover_image
  end
end
