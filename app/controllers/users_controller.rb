class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if params[:user][:password] == params[:user][:password_confirmation]
      @user.save
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
