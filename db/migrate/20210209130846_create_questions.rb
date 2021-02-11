class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :subject, null: false
      t.text :problem, null: false

      t.timestamps
    end
  end
end
