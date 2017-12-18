class HomeController < ApplicationController
	def randomworkout
		len = Workout.where("min_lvl <  5").count
		@r_workout = Workout.find(1 + rand(len))
	end

	def index
		@r_workout = randomworkout
		if current_user
			if current_user.complete == false
				redirect_to edit_user_path(current_user)
			end
		else
			redirect_to new_user_session_path
		end
	end


end
