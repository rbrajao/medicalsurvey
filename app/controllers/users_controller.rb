class UsersController < ApplicationController
    before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: 'User created successfully.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if params[:user][:encrypted_password].blank?
      @user.update_without_password(user_params)
      render :edit
    else
        @user.password = params[:user][:encrypted_password]
        @user.save(validate: false) # Salva as alterações sem validar a senha atual
        redirect_to users_path, notice: 'User updated successfully.'
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User deleted successfully.'
  end

  private

  def user_params
    params.require(:user).permit(:email, :encrypted_password, :password_confirmation, :role, :status)
  end
end
