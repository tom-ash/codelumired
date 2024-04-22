class AddCvToPostingApplications < ActiveRecord::Migration[7.0]
  def change
    add_column :posting_applications, :cv, :string
  end
end
