class RenameJobSkillsToCovetedSkills < ActiveRecord::Migration[6.1]
  def change
    rename_table :job_skills, :coveted_skills
  end
end
