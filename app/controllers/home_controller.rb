class HomeController < ApplicationController


	def index
		
		if current_user
			if current_user.complete == false
				redirect_to edit_user_path(current_user)
			end
		else
			redirect_to new_user_session_path
		end
	end


end
