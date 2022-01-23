class RemoveDistrictFromAnnouncements < ActiveRecord::Migration[6.1]
  def change
    remove_column :announcements, :district
  end
end
