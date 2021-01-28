class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :mail, null: false
      t.text :name, null: false
      t.text :password, null: false

      t.timestamps
      t.index :email, unique: true
    end
  end
end
