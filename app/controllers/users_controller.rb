class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
     @user = User.new(params.require(:user).permit!)
     @user.save
     redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
end
