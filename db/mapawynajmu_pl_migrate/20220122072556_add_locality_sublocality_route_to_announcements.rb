class AddLocalitySublocalityRouteToAnnouncements < ActiveRecord::Migration[6.1]
  def change
    add_column :announcements, :locality, :string
    add_column :announcements, :sublocality, :string
    add_column :announcements, :route, :string
  end
end
