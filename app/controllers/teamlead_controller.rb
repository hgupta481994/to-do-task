class TeamleadController < ApplicationController

	def assign_t_multiple_update
		

		if (:employee != nil)
			Task.where(id: params[:tasks_ids]).update_all user_id: params[:employee]
    		redirect_to root_path
		else 
			puts "You Didn't selected any user "
			redirect_to root_path
		end
	end

end
