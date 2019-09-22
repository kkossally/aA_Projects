class CreateAnswerChoice < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_choices do |t|
      t.text  :text, null: false
      t.integer :question_id, null: false
    end
    add_index :answer_choices, :question_id, unique: true
  end
end
