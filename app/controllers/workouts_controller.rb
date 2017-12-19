class WorkoutsController < ApplicationController
  def show
  end

  def new

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    @workouts = Workout.all
  end
end
