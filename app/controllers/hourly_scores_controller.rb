class HourlyScoresController < ApplicationController


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
    @user = current_user
    @update_score = @user.hourly_scores.last
    @update_score.update(score_params)
    current_user.increment!('experience', 50)

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

