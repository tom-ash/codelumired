class RemoveFeaturesFurnishingsNullConstraintsFromAnnouncements < ActiveRecord::Migration[6.0]
  def change
    change_column_null :announcements, :features, true
    change_column_null :announcements, :furnishings, true
  end
end
