class UsersController < ApplicationController

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

#Show the current user's events (upcoming and pervious columns)
  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.get_upcoming
    @previous_events = @user.get_previous
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
