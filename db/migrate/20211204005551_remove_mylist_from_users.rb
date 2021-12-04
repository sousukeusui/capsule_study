class RemoveMylistFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :mylist, :integer
  end
end
