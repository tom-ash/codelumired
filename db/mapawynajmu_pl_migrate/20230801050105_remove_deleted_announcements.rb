class RemoveDeletedAnnouncements < ActiveRecord::Migration[7.0]
  def change
    drop_table :deleted_announcements
  end
end
