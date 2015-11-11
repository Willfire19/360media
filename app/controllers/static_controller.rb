class StaticController < ApplicationController
  
  def home
  	
  	@pictures = Picture.take(3)

  	if user_signed_in?
  		@user = current_user
  	end


  end

end
