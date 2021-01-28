class ChangeDataMailToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :mail, :string
  end
end
