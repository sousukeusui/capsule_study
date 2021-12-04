class CreateMylists < ActiveRecord::Migration[6.1]
  def change
    create_table :mylists do |t|
      t.integer :user_id
      t.integer :post_question_id

      t.timestamps
    end
  end
end
