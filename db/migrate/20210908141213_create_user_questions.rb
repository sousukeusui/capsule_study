class CreateUserQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :user_questions do |t|
      t.text :name, null: false
      t.text :problem, null: false
      t.text :answer, null: false
      t.text :mistake1, null: false
      t.text :mistake2
      t.text :mistake3
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
