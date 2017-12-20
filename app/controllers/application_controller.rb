class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def wav(user)
    current_hour = (Time.now.hour + 7) % 12
  
    if user.hourly_scores.last
      puts "This is the current hour"
      p current_hour
      puts "This is the users last hour"
      p current_user.hourly_scores.last.created_at.hour
      if user.hourly_scores.last.created_at.hour.to_i != current_hour
        return true
      end
      if current_user.hourly_scores.last.created_at.hour.to_i == current_hour
        return false
      end
    else
      return true
    end
  end


end
