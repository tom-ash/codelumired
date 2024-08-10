class AdjustSkills < ActiveRecord::Migration[7.0]
  def change
    remove_column :skills, :principal_skill_id
    remove_column :skills, :name
    remove_column :skills, :type
    remove_column :skills, :description

    add_column :skills, :value, :string, limit: 50
    add_column :skills, :en, :string, limit: 50
    add_column :skills, :pl, :string, limit: 50
    add_column :skills, :route_en, :string, limit: 50
    add_column :skills, :route_pl, :string, limit: 50
    add_column :skills, :description_en, :string, limit: 1000
    add_column :skills, :description_pl, :string, limit: 1000

    add_index :skills, :value, unique: true
    add_index :skills, :en, unique: true
    add_index :skills, :pl, unique: true
    add_index :skills, :route_en, unique: true
    add_index :skills, :route_pl, unique: true
  end
end
