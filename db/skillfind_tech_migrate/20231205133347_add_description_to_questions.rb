class AddDescriptionToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :description, :string
  end
end
