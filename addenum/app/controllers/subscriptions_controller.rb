class SubscriptionsController < ApplicationController

  def create
    puts session[:user_id]
    puts params[:podpage_id]
    puts "above should hold the feilds we're passing"
    Subscription.create(user_id: session[:user_id], podpage_id: params[:podpage_id])
    redirect_to podpage_path(params[:podpage_id])
  end
  def destroy
    @mem = Subscription.find_by(id:params[:id])
    puts "wow you actually got here"
    @mem.delete

    redirect_to users_path
  end
end
