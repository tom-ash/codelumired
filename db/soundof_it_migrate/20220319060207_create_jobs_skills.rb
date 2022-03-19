class CreateJobsSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs_skills do |t|
      t.belongs_to :job, foreign_key: true, null: false
      t.belongs_to :skill, foreign_key: true, null: false

      t.timestamps
    end
  end
end
