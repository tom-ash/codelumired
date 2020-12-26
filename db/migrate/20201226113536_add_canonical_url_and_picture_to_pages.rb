class AddCanonicalUrlAndPictureToPages < ActiveRecord::Migration[6.0]
  def up
    add_column :pages, :canonical_url, :string
    add_column :pages, :picture, :string

    remove_column :pages, :title_tag
  end

  def down
    remove_column :pages, :picture
    remove_column :pages, :canonical_url

    add_column :pages, :title_tag, :string
  end
end
