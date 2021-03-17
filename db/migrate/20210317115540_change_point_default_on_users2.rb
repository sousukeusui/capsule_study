class ChangePointDefaultOnUsers2 < ActiveRecord::Migration[6.1]
  def up
    change_column :users,:point,:integer
  end

  def down
    change_column :users,:point,:integer,default: 100
  end
end
