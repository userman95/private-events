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
      flash[:danger] = 'Username is taken'
    end
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
