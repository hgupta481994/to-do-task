class Users::UserController < ApplicationController
	def done_t_multiple_update

		Task.where(id: params[:tasks_ids]).update_all(status: false)
    	redirect_to root_path
	end
end
