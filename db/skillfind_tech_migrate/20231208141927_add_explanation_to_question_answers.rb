class AddExplanationToQuestionAnswers < ActiveRecord::Migration[7.0]
  def up
    remove_column :questions, :explanation
    add_column :question_answers, :explanation, :string
  end
end
