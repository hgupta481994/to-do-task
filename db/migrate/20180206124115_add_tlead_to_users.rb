class AddTleadToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :tlead, :boolean
  end
end
