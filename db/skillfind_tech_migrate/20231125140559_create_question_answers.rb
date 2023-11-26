class CreateQuestionAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :question_answers, :id => :uuid do |t|
      t.references :question, type: :uuid, foreign_key: true, null: false
      t.string :sequence_letter, null: false
      t.string :body, null: false
      t.boolean :is_correct, null: false, default: false

      t.timestamps
    end
  end
end
