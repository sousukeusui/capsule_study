class CreatePostQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :post_questions do |t|
      t.text :name, null: false
      t.text :explanation, null: false
      t.text :number_of, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
