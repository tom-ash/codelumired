class RemoveRouteFromAnnouncements < ActiveRecord::Migration[6.1]
  def change
    remove_column :announcements, :route
  end
end
