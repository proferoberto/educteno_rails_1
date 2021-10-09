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
    @user = User.find_by(id: params[:id])
    unless @user
      flash[:error] = "No se ha encontrado el usuario"
      redirect_to root_path
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user
      if @user.update(user_params)
        flash[:notice] = "El usuario #{@user.name} fue actualizado"
      else
        flash[:error] = "El usuario no se pudo actualizar"  
      end
    else
      flash[:error] = "El usuario no existe"
    end
    redirect_to root_path      
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      if @user.delete
        flash[:notice] = "El usuario #{@user.name} fue eliminado"
      else
        flash[:error] = "El usuario #{@user.name} no se pudo eliminar"
      end
      redirect_to root_path
    else
      flash[:error] = "El usuario no existe"
      redirect_to root_path
    end
  end

  #strong_params
  private
  def user_params
    params.require(:user).permit(:name, :lastname, :email)
  end
end
