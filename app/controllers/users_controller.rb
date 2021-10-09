class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    n_params = params[:user]
    @user = User.new(name: n_params[:name], lastname: n_params[:lastname], email: n_params[:email])
    @user.save
    if @user
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  #strong_params
  private
  def user_params
    params.require(:user).permit(:name, :lastname, :email)
  end
end
