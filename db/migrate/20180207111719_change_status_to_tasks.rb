class ChangeStatusToTasks < ActiveRecord::Migration[5.1]
  def change
  	change_column :tasks, :status, :boolean, default: false
  end
end
