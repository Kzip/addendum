class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    flash[:danger] = []
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      puts "somewhere this is gonna show up"
      #@groups = Group.all

      redirect_to users_path
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
