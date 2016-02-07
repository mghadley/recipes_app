 class SessionController < ApplicationController
  def new
  end

  def create
  	if params[:session][:password] == "password88"
  		session[:user] = "admin"
  		flash[:success] = "Sign in successful. You may now edit the recipe book."
  		redirect_to root_path
  	else
  		flash[:danger] = "Incorrect password"
  		redirect_to login_path
	  end
	end

  def destroy
  	session[:user] = nil
  	redirect_to root_path
	end
end
