class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :start
      t.date :end
      t.boolean :status
      t.integer :user_id
      t.integer :team_id

      t.timestamps
    end
  end
end
