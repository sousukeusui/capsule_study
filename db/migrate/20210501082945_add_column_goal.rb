class AddColumnGoal < ActiveRecord::Migration[6.1]
  def change
    add_column :users,:goal,:string
  end
end
