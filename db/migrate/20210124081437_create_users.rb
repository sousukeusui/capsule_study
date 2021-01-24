class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :mail
      t.text :name
      t.text :password

      t.timestamps
    end
  end
end
