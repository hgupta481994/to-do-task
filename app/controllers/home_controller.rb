class HomeController < ApplicationController
	
  def index
  	@tasks= Task.all.order("created_at DESC")
  	@users= User.all.order("created_at DESC")
  	if(current_user.present?)
  		@tl= Teamlead.find_by_username(current_user.username)
  		@cu   = User.where(:teamlead_id => @tl.id)
  	end 
  end


end
