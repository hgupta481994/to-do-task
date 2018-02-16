class TasksController < ApplicationController

	# load_and_authorize_resource
	before_action :find_task, only: [:show, :edit, :update, :destroy]
 	
  def index
  	@tasks= Task.all.order("created_at DESC").paginate(page: params[:page], per_page: 5) 
  	end

  def new
  	@task= current_user.tasks.build
  end

def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:notice] = "Task successfully created"
      if current_user.is_admin?
        redirect_to '/action'
      else
      redirect_to '/home'
    end
    else
      render 'new'
    end
  end 

  def show
  	
  end 

  def edit
  	
  end 

  def update
  	
  	if @task.update_attributes(task_params)
  		redirect_to(:action =>'show', :id => @task.id)
  	else
  		render 'edit'
  	end
  end

  def destroy
  	
  	@task.destroy
  	redirect_to 'root'
  end



  

  def find_task
  	@task = Task.find(params[:id])
  end

  private 
    def task_params 
    	 params.require(:task).permit(:name,:description,:start,:end, :teamlead_id) 
  	end

  def edit_multiple
    @tasks = Task.find(params[:task_ids])
  end

  def update_multiple
    @tasks = Task.update(params[:tasks].keys, params[:tasks].values)
    @tasks.reject! { |p| p.errors.empty? }
     if @tasks.empty?
      redirect_to '/action'
     else
       render "edit_multiple"
     end
   end


end
