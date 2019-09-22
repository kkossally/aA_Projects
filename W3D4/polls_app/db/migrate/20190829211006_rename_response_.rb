class RenameResponse < ActiveRecord::Migration[5.2]
  def change
    rename_column :responses, :question_id, :respondent_id
  end
end
