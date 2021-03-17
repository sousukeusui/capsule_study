class ChangeCountDefaultOnUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :count,:integer,default: 0
  end

  def down
    change_column :users, :count, :integer
  end
end
