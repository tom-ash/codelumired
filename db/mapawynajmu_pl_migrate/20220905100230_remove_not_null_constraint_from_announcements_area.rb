class RemoveNotNullConstraintFromAnnouncementsArea < ActiveRecord::Migration[6.1]
  def change
    change_column_null :announcements, :area, true
  end
end
