class RemovePasswordFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password, :text
  end
end
