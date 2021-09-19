class AddPostquestionidToUserquestion < ActiveRecord::Migration[6.1]
  def change
    add_column :user_questions, :post_question_id, :integer

    remove_column :user_questions, :name, :text
  end
end
