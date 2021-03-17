class AddMistakesToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :mistake1, :string, null: false
    add_column :questions, :mistake2, :string, null: false
    add_column :questions, :mistake3, :string, null: false
    
  end
end
