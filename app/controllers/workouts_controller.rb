class WorkoutsController < ApplicationController
  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
    @number_of_levels = (1..20).map { |x| x }
    @number_of_reps = (1..20).map { |x| x }
  end

  def create
    @workout = Workout.create(workout_params)
    redirect_to @workout
  end

  def edit
    @workout = Workout.find(params[:id])
    @number_of_levels = (1..20).map { |x| x }
    @number_of_reps = (1..20).map { |x| x }
  end

  def update
    @workout = Workout.find(params[:id])
    @workout.update(workout_params)
    redirect_to @workout
  end

  # def destroy
  #   Workout.find(params[:id]).destroy
  #   redirect_to workouts_path
  # end

  def destroy
    @workout = Workout.find(params[:id])

    respond_to do |format| 
      @workout.destroy
      format.js
    end
    
  end

  def index
    @workouts = Workout.all
  end

  private

  def workout_params
    params.require(:workout).permit(:title, :description, :min_lvl, :min_reps, :video_url, :wiki_link)
  end

end
