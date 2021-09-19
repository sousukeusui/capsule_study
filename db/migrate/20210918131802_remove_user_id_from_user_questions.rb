class RemoveUserIdFromUserQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_questions, :user_id, :integer
  end
end
