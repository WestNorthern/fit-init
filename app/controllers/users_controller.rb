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
    @gender = ['Male', 'Female', 'NA']
  end

  def update
  	@user = current_user

    respond_to do |format|
      if @user.update(user_params)
        @user.update(complete: true)
        format.html { redirect_to @user }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  private


  def user_params
    params.require(:user).permit(:location, :birthday, :height, :weight, :difficulty, :gender)
  end
end
