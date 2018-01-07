class HomeController < ApplicationController


	def index
		@user = current_user
		if current_user
			if current_user.complete == false
				redirect_to edit_user_path(current_user)
			end
			# If the current record has hydration, and no workout, change model to update
			if @user.hourly_scores.last
				if @user.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").hour == Time.now.in_time_zone("Mountain Time (US & Canada)").hour && @user.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").day == Time.now.in_time_zone("Mountain Time (US & Canada)").day && @user.hourly_scores.last.workout == nil && @user.hourly_scores.last.hydrated == true
					@hourly_score = @user.hourly_scores.last
				else
					@hourly_score = HourlyScore.new
				end
			else
				@hourly_score = HourlyScore.new
			end

			# If the current record has a workout and no hydration, change model to update
			if @user.hourly_scores.last
				if @user.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").hour == Time.now.in_time_zone("Mountain Time (US & Canada)").hour && @user.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").day == Time.now.in_time_zone("Mountain Time (US & Canada)").day
					@update_score = @user.hourly_scores.last
				else
					@update_score = HourlyScore.new
				end
	  	else
	  		@update_score = HourlyScore.new
	  	end

			@r_workout = @user.random_workout
		else
			redirect_to new_user_session_path
		end
		
	
	end


end
