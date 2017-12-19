class HourlyScoresController < ApplicationController

  def wav(user)
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


  def index
  end

  def new
    @hourly_score = HourlyScore.new
  end

  def create
    
    if wav(current_user) == false
      respond_to do |format|
        format.js
      end
    elsif wav(current_user) == true
      @user = current_user.hourly_scores.create(score_params)
      current_user.increment!('experience', 50)
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private

  def score_params
    params.require(:hourly_score).permit(:workout, :hydrated)
  end
end

