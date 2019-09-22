class RemoveUnnecessaryUniquenessConstraints < ActiveRecord::Migration[5.2]
  def change
    remove_index :polls, :user_id 
    add_index :polls, :user_id 

    remove_index :questions, :poll_id 
    add_index :questions, :poll_id 

    remove_index :responses, [:respondent_id, :answer_id]
    add_index :responses, [:respondent_id, :answer_id]

  end
end
