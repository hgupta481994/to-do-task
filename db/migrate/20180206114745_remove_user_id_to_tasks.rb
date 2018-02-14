class RemoveUserIdToTasks < ActiveRecord::Migration[5.1]
  def change
  	remove_column :tasks, :user_id
  	remove_column :tasks, :team_id
  end
end
