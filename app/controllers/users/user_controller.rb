class Users::UserController < ApplicationController

	before_action :find_user, only: [:show, :destroy]
	before_action :authenticate_user!, except:[:index, :show] 


	def find_user
  		@user = User.find(params[:id])
  	end

	def done_t_multiple_update

		Task.where(id: params[:tasks_ids]).update_all(status: false)
    	redirect_to root_path
	end

	def destroy
		authorize!  :destroy, @user
		@id=@user.id
		@task=Task.find(:teamlead_id => @id).teamlead_id => 1

  		@user.destroy
  		redirect_to "/action/tlead"
	end



end
