class AddAssessesToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :assesses, :string
  end
end
