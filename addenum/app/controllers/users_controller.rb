class UsersController < ApplicationController
  respond_to :html, :js
  def index
    @pages = Podpage.all
    @yours = Podpage.where(id:Subscription.select('podpage_id').where(user_id:session[:user_id]))
  end

  def create
    user = User.new(user_params)
    if user.save
     session[:user_id] = user.id
     redirect_to users_path
   else
     redirect_to root_path
   end
  end

   private
   def user_params
     params.require(:user).permit(:name,:email,:password)
   end
end
