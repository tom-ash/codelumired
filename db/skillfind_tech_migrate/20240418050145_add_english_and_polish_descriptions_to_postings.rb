class AddEnglishAndPolishDescriptionsToPostings < ActiveRecord::Migration[7.0]
  def change
    add_column :postings, :en_description, :string
    add_column :postings, :pl_description, :string

    remove_column :postings, :description, :string
    remove_column :users, :description, :string
  end
end
