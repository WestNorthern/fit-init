class HomeController < ApplicationController


	def index
		if current_user.complete == false
			redirect_to info_user_path
		end
		if current_user
		else
			redirect_to new_user_session_path
		end
	end


end
