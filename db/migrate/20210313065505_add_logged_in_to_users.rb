class AddLoggedInToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :logged_in, :datetime
  end
end
