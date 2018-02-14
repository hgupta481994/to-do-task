class AddUserToTasks < ActiveRecord::Migration[5.1]
  def change
    add_reference :tasks, :user, foreign_key: true
    add_reference :tasks, :teamlead, foreign_key: true
  end
end
