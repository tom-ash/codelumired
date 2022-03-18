class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.belongs_to :added_by, foreign_key: { to_table: :users }, null: false
      t.belongs_to :principal_skill, foreign_key: { to_table: :skills }
      t.string :name, null: false
      t.string :type, null: false
      t.text :description

      t.timestamps
    end
  end
end
