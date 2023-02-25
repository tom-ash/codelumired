class RenameJobsSkillsToJobSkills < ActiveRecord::Migration[6.1]
  def change
    rename_table :jobs_skills, :job_skills
  end
end
