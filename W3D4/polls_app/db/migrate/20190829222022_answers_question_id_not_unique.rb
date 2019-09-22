class AnswersQuestionIdNotUnique < ActiveRecord::Migration[5.2]
  def change
    remove_index :answer_choices, :question_id 
    add_index :answer_choices, :question_id 
  end
end
