class AddApplicationMannersToPostings < ActiveRecord::Migration[7.0]
  def change
    add_column :postings, :form_application_manner, :boolean, null: false
    add_column :postings, :link_application_manner, :boolean, null: false
    add_column :postings, :application_link, :string, limit: 2000
  end
end
