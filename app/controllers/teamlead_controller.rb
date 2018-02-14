class TeamleadController < ApplicationController

	def Assign_t_multiple
		@tasks = Task.where(id: params[:tasks_ids])
	end

	def Assign_t_multiple_update
		
		
	end

end
