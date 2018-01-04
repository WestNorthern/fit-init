class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :birthday, presence: true

  has_many :hourly_scores

  # determines player level based on exp
  def lvl 
    lvl = 0
    exp = self.experience.to_f
    if self.experience == nil
      lvl = 1
    else
      lvl = (0.1 * Math.sqrt(exp)).to_i
      # lvl = sqrt(100 * (self.experience)) / 100
    end
    return lvl
  end

  # returns an array of exp/lvl arrays, using the same algorithm from lvl
  def self.exp_per_lvl
    exp_to_20_arr = []
    for i in 1..20

      temp_arr = []
      temp_arr.push(i)

      exp = (i**2) * 100
      temp_arr.push(exp)
      exp_to_20_arr.push(temp_arr)
    end
    return exp_to_20_arr
  end

  # gets current hour in utc
  def current_hour
    Time.now.in_time_zone("Mountain Time (US & Canada)").hour
  end

  # returns current day in utc
  def current_day
  	Time.now.in_time_zone("Mountain Time (US & Canada)").day
  end

  def current_complete # returns whether or not user has worked out this hour
  	today = current_day
  	now = current_hour
  	if self.hourly_scores.last
  		if self.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").day == today
  			if self.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").hour == current_hour
  				return true
  			else
  				return false
  			end
  		end
  	end

  end

  # returns whether or not user has hydrated this hour
  def is_hydrated 
  	today = current_day
  	now = current_hour

  	if self.hourly_scores.last
  		if self.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").day == today
  			if self.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").hour == current_hour
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

  # returns array of the previous three hours
  def last_three 
		now = current_hour
		x = 3
		arr = []
		while x > 0
			arr.push((now - x) % 23)
			x -= 1
		end
		return arr
	end

  # returns true if workout is available
  def wav
  	now = current_hour

    if self.hourly_scores.last
      
      if self.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").hour != now
        return true
      end

      if self.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").hour == now && self.hourly_scores.last.workout == nil
        return true
      end

      if self.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").hour == now && self.hourly_scores.last.workout != nil
        return false
      end

    else
      return true
    end
  end # end of WAV


  # checks to see if the past three hours have been completed
  def hourbar_array 
  	result_arr = []
  	today = current_day
  	three_arr = last_three

  	if self.hourly_scores.last
  		if self.hourly_scores.last.created_at.in_time_zone("Mountain Time (US & Canada)").day != today
  			return [false, false, false]
  		end
  	end

  	if self.hourly_scores.count < 4
  		scores_arr = self.hourly_scores.all.map { |x| x.created_at.in_time_zone("Mountain Time (US & Canada)").hour }
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
  		scores_arr = self.hourly_scores.all.map { |x| x.created_at.in_time_zone("Mountain Time (US & Canada)").hour }
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


  #returns an array with the hourly score of any given day
  def day_score_workout(date) 
  	score_arr = []
  	puts "whatever this is..."
  	p self.hourly_scores.where(created_at: date.in_time_zone("Mountain Time (US & Canada)").midnight..date.in_time_zone("Mountain Time (US & Canada)").end_of_day).count
  	scores = self.hourly_scores.where(created_at: date.in_time_zone("Mountain Time (US & Canada)").beginning_of_day..date.in_time_zone("Mountain Time (US & Canada)").end_of_day).to_a
  	workout_scores = scores.select { |x| x.workout != nil }
    score_hours = workout_scores.map { |x| x.created_at.in_time_zone("Mountain Time (US & Canada)").hour }
  	puts "then this..."
  	p score_hours
  	(0..23).each do |x|
  		if score_hours.include? x
  			score_arr.push(true)
  		else
  			score_arr.push(false)
  		end
  	end
  	return score_arr.each_slice(2).to_a
  end

  # returns an array with hourly hydration score for a date
  def day_score_hydration(date) 
  	score_arr = []
  	hydrated_scores = []
  	scores = self.hourly_scores.where(created_at: date.in_time_zone("Mountain Time (US & Canada)").beginning_of_day..date.in_time_zone("Mountain Time (US & Canada)").end_of_day).to_a
  	hydrated_scores = scores.select { |x| x.hydrated == true }
  	puts "Hydrated scores"
  	p hydrated_scores
  	score_hours = hydrated_scores.map { |x| x.created_at.in_time_zone("Mountain Time (US & Canada)").hour }
  	puts "Hydrated hours"
  	p score_hours
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
