class AddDefaultValueToTleadAttribute < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :tlead, :boolean, default: false
  end
end
