class RenamePostingSkillsToSelectedSkills < ActiveRecord::Migration[7.0]
  def change
    rename_table :posting_skills, :selected_skills
  end
end
