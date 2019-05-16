class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = 'Welcome'
      redirect_to controller: 'users', action: 'show', id: @user.id
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user
      @upcoming_events = get_upcoming
      @previous_events = get_previous
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def get_upcoming
    current_user.attendances.where("created_at > ?",Time.zone.now)
  end

  def get_previous
    current_user.attendances.where("created_at < ?",Time.zone.now)
  end

end
