class EmployeeController < ApplicationController
	def done_t_multiple_update

		@tasks= Task.where(id: params[:tasks_ids])
		@tasks.each do |t|
			t.status= !t.status
			t.save
		end
    	redirect_to root_path
	end

end
