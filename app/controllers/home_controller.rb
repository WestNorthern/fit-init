class HomeController < ApplicationController

	def daily_score(user)
		puts "Why broken?"
	end

	def user_lvl(user)
		lvl = 0
		if current_user

			if user.experience == nil
				lvl = 10
			else
				lvl = user.experience/100
			end

		end
			return lvl
	end

	def randomworkout
		puts "here is the current user level:"
		p user_lvl(current_user)
		len = Workout.where("min_lvl <  5").count
		@r_workout = Workout.find(1 + rand(len))
	end

	def index
		@user = current_user
		@hourly_score = HourlyScore.new
		if @user.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").hour == Time.now.in_time_zone("Mountain Time (US & Canada)").hour && @user.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").day == Time.now.in_time_zone("Mountain Time (US & Canada)").day
			@update_score = @user.hourly_scores.last
		else
			@update_score = HourlyScore.new
		end
  	@user = current_user
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
