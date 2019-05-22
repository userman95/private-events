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

  def show
    @user = User.find(params[:id])
    if current_user
      @upcoming_events = User.get_upcoming(current_user)
      @previous_events = User.get_previous(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
