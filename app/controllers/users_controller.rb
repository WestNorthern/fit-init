class UsersController < ApplicationController

  def index
  	@users = User.all.reverse

  end

  def show
  	@user = current_user.id
  end

  def info
  	@user = current_user
  end

end
