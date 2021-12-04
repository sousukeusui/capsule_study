class AddMylistToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :mylist, :integer
  end
end
