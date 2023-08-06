class RenameJobsToPostings < ActiveRecord::Migration[7.0]
  def change
    rename_table :jobs, :postings
    rename_table :coveted_skills, :posting_skills
    rename_column :posting_skills, :job_id, :posting_id
  end
end
