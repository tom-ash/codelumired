class RemoveAddedByIdFromSkills < ActiveRecord::Migration[6.1]
  def change
    remove_column :skills, :added_by_id
  end
end
