class AddNameLinkAndAdminIdToAnnouncements < ActiveRecord::Migration[6.1]
  def change
    add_column :announcements, :name, :string
    add_column :announcements, :link, :string
    add_reference :announcements, :admin, foreign_key: { to_table: :users }
  end
end
