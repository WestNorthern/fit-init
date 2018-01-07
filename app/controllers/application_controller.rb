class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def wav(user)
    # current_hour = Time.now.in_time_zone("Mountain Time (US & Canada)").hour
    current_hour = Time.now.utc.hour
  
    if user.hourly_scores.last
      if user.hourly_scores.last.created_at.hour.to_i != current_hour 
        return true
      end
      if current_user.hourly_scores.last.created_at.hour.to_i == current_hour && user.hourly_scores.last.workout == nil
        return true
      end
      if current_user.hourly_scores.last.created_at.hour.to_i == current_hour && user.hourly_scores.last.workout != ''
      	puts "Why is wav false?"
      	p user.hourly_scores.last.workout
        return false
      end
    else
      return true
    end
  end


end
