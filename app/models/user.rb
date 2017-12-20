class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :birthday, presence: true

  has_many :hourly_scores

  # gets current hour in utc
  def current_hour
    Time.now.utc.hour
  end

  # returns current day in utc
  def current_day
  	Time.now.utc.day
  end

  def current_complete
  	today = current_day
  	now = current_hour
  	if self.hourly_scores.last
  		if self.hourly_scores.last.created_at.utc.day == today
  			if self.hourly_scores.last.created_at.utc.hour == current_hour
  				return true
  			else
  				return false
  			end
  		end
  	end

  end



  def last_three # returns array of the previous three hours
		now = current_hour
		x = 3
		arr = []
		while x > 0
			arr.push(now - x)
			x -= 1
		end
		return arr
	end


  def wav # returns true if workout is available
  	now = current_hour

    if self.hourly_scores.last
      
      if self.hourly_scores.last.created_at.utc.hour != now
        return true
      end

      if self.hourly_scores.last.created_at.utc.hour == now
        return false
      end

    else
      return true
    end
  end # end of WAV



  def hourbar_array
  	result_arr = []
  	today = current_day
  	three_arr = last_three

  	if self.hourly_scores.last
  		if self.hourly_scores.last.created_at.utc.day != today
  			return [false, false, false]
  		end
  	end

  	if self.hourly_scores.count < 4
  		scores_arr = self.hourly_scores.all.map { |x| x.created_at.utc.hour }
  		three_arr.each_with_index do |x, y|
  			if scores_arr.include? x
  				result_arr.push(true)
  			else
  				result_arr.push(false)
  			end
  		end
  		return result_arr
  	end


  	if self.hourly_scores.last
  		scores_arr = self.hourly_scores.last(4).map { |x| x.created_at.utc.hour }
  		three_arr.each_with_index do |x, y|
  			if scores_arr.include? x
  				result_arr.push(true)
  			else
  				result_arr.push(false)
  			end
  		end
  		return result_arr
  	else
  		return [false, false, false]
  	end

  	

  end # end of hourbar_array



  def last_24_arr
  	current_day
  end


end
