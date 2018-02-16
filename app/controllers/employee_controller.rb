class EmployeeController < ApplicationController

	before_action :find_employee, only: [:show, :destroy]
	
	def find_employee
  		@employee = User.find(params[:id])
  	end

	def destroy

		@task=Task.find_by_user_id(@employee.id)
		if @task != nil
			@task.update_attribute(:user_id, @task.teamlead_id)
		end 
  		@employee.destroy
  		redirect_to "/action/tlead"
	end

	def done_t_multiple_update

		@tasks= Task.where(id: params[:tasks_ids])
		@tasks.each do |t|
			t.status= !t.status
			t.save
		end
    	redirect_to root_path
	end

end
