class AddTeamleadToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :teamlead, foreign_key: true
  end
end
