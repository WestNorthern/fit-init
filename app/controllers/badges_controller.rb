class BadgesController < ApplicationController
  def show
    @badge = Badge.find(params[:id])
  end

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.create(badge_params)
    redirect_to @badge
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def update
    @badge = Badge.find(params[:id])
    @badge.update(badge_params)
    redirect_to @badge
  end

  def destroy
    @badge = Badge.find(params[:id])

    respond_to do |format| 
      @badge.destroy
      format.js
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :description, :image_url, :user_id)
  end
end
