class RemoveNomberOfFromPostQuestions < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_questions, :number_of, :integer
  end
end
