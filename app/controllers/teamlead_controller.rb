class TeamleadController < ApplicationController

	before_action :find_teamlead, only: [:show, :destroy]
	 

	def find_teamlead
  		@teamlead = Teamlead.find(params[:id])
  	end

	def assign_t_multiple_update
		

		if (:employee != nil)
			Task.where(id: params[:tasks_ids]).update_all user_id: params[:employee]
    		redirect_to root_path
		else 
			puts "You Didn't selected any user "
			redirect_to root_path
		end
	end

	def destroy
		

		
  		#@tasks=Task.connection.select_all("SELECT * FROM tasks WHERE teamlead_id = '@teamlead.id'")
  		
  		Task.where(teamlead_id: @teamlead.id).update_all teamlead_id: 1
  		User.where(teamlead_id: @teamlead.id).update_all teamlead_id: 1
  		@user=User.find_by_username(@teamlead.username)
		
		@user.update_attribute(:tlead, false)
		 

		@teamlead.destroy

  		redirect_to "/action/tlead"
	end

end
