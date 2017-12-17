class UsersController < ApplicationController

  def index
  	@users = User.all.reverse

  end

  def show
  	@user = current_user.id
  end

  def edit
  	@user = current_user
    h = (50..100).map { |inch|  {(inch/12).floor.to_s+'\''+(inch%12).to_s => inch } }
    @heights = h.reduce Hash.new, :merge
  end

  def update
  	@user = current_user
  end
end
