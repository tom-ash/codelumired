class AddUniqueIndexOnNameToSkills < ActiveRecord::Migration[6.1]
  def change
    add_index :skills, :name, unique: true
  end
end
