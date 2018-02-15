class HomeController < ApplicationController
	
  def index
  	@tasks= Task.all.order("created_at DESC")
  	@users= User.all.order("created_at DESC")
  	if(current_user.present?)
  		@cu   = User.where(:teamlead_id => current_user.id)
  	end 
  end


end
