class AdminController < ApplicationController

	
	
 	before_action :authenticate_user!, except:[:index, :show] 
  def action
  	@tasks= Task.all.order("created_at DESC")
  	@tleads= Teamlead.all.order("created_at DESC")
  	authorize! :read, @users
  	authorize! :read, @tasks
  end

  def tlead
  	@tleads= Teamlead.all.order("created_at DESC")
  	@users= User.all.order("created_at DESC")
  end

  def assign_user_to_tl
    @users= User.all.order("created_at DESC")
    @tl   = Teamlead.find(params[:id])
    
  end

  def assign_multiple_user
    @uassign = User.where(id: params[:user_ids]).update_all teamlead_id: params[:tid]
    redirect_to '/action/tlead'  
  end

  def edit_multiple
    @tasks = Task.where(id: params[:tasks_ids])
  end

  def update_multiple
    @tasks = Task.update(params[:tasks].keys, params[:tasks].values)
   
      redirect_to '/action'
     
   end

   def tlead_multiple
      @user = User.find(params[:id])
      @user.tlead = true
      @user.save
      Teamlead.create(:username => @user.username)


      redirect_to 'admin/tlead'

   end

   private 
    def task_params 
       params.require(:task).permit(:name,:description,:start,:end, :teamlead_id) 
    end


end
