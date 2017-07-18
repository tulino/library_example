class UsersController < ApplicationController
  before_action :find_user, only: [:show,:edit,:update,:destroy]
  def index
    @users = User.all

  end
  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show

  end
  def edit
    @user = User.find(params[:id])
  end
  def update

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  def destroy
    @user.destroy
    redirect_to users_path

  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :email)
  end
  def find_user
    @user = User.find(params[:id])
  end
end
