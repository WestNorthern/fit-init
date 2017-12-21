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

  def is_hydrated
  	today = current_day
  	now = current_hour

  	if self.hourly_scores.last
  		if self.hourly_scores.last.created_at.utc.day == today
  			if self.hourly_scores.last.created_at.utc.hour == current_hour
  				if self.hourly_scores.last.hydrated == true
  					return true
  				else
  					return false
  				end
  			end
  		end
  	end
  	return false
  end


  def last_three # returns array of the previous three hours
		now = current_hour
		x = 3
		arr = []
		while x > 0
			arr.push((now - x) % 23)
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
  		scores_arr = self.hourly_scores.all.map { |x| x.created_at.utc.hour }
  		puts "the scores array"
  		p scores_arr
  		three_arr.each_with_index do |x, y|
  			if scores_arr.include? x
  				result_arr.push(true)
  			else
  				puts "wtf mate"
  				result_arr.push(false)
  			end
  		end
  		return result_arr
  	else
  		return [false, false, false]
  	end

  	

  end # end of hourbar_array



  def day_score(date)
  	score_arr = []
  	puts "whatever this is..."
  	p self.hourly_scores.where(created_at: date.midnight.utc..date.end_of_day.utc).count
  	scores = self.hourly_scores.where(created_at: date.midnight.utc..date.end_of_day.utc).to_a
  	score_hours = scores.map { |x| (x.created_at.utc.hour - 7) % 23 }
  	(0..23).each do |x|
  		if score_hours.include? x
  			score_arr.push(true)
  		else
  			score_arr.push(false)
  		end
  	end
  	return score_arr.each_slice(2).to_a
  end


end
