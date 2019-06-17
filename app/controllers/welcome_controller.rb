class WelcomeController < ApplicationController

  def welcome
    byebug
    @user = User.find(session[:user_id])
  end

end
