class ChangePointDefaultOnUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :point,:integer,default: 100
  end

  def down 
    change_column :users,:point,:integer
  end
end
