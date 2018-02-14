class HomeController < ApplicationController
	
  def index
  	@tasks= Task.all.order("created_at DESC")
  	@users= User.all.order("created_at DESC")
  	
  end
end
