class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    unless @user
      flash[:error] = "No se ha encontrado el usuario"
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
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
