class SessionsController < ApplicationController
	
	def new
	end
	
	def create

		if params[:user][:name].nil? || params[:user][:password].nil?
			redirect_to login_path
		else
			@user = User.find_by(name: params[:user][:name])
			
			if @user.nil?
				redirect_to login_path
			else
				return head(:forbidden) unless @user.authenticate(params[:user][:password])
				session[:user_id] = @user.id
				
				render :"users/home" 
			end
			
		end
		
	end
	
	def destroy
		session.delete :user_id
		
		redirect_to login_path
	end
	
end