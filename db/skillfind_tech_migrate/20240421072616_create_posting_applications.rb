class CreatePostingApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :posting_applications, :id => :uuid do |t|
      t.references :posting, foreign_key: true, null: false
      t.string :first_name, null: false, limit: 255
      t.string :last_name, null: false, limit: 255
      t.string :email, null: false, limit: 255
      t.string :phone_number, limit: 255
      t.string :linked_in_profile, limit: 255
      t.string :git_hub_account, limit: 255

      t.timestamps
    end
  end
end
