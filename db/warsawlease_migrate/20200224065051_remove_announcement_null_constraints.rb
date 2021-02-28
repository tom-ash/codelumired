class RemoveAnnouncementNullConstraints < ActiveRecord::Migration[6.0]
  def change
    change_column_null :announcements, :rooms, true
    change_column_null :announcements, :floor, true
    change_column_null :announcements, :total_floors, true
    change_column_null :announcements, :availability_date, true
  end
end
