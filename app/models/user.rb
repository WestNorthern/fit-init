class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hourly_scores

  def wav(user) # returns true if workout is available

    current_hour = Time.now.hour + 7
  
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
