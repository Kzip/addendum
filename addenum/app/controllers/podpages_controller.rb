class PodpagesController < ApplicationController
  before_action :all_tasks, only: [:index, :destroy]
  before_action :set_tasks, only: [:edit, :update, :destroy]
  




 respond_to :html, :js

 # index action has been removed

 def new
   @ppage = Podpage.new
 end

 def create
   @ppage  = Podpage.create(name:ppage_params[:name],description:ppage_params[:description])
   Subscription.create(user_id: session[:user_id], podpage_id: @ppage.id)
   redirect_to podpage_path(@ppage.id)
 end

 def show
     #@songs = Podcast.all.cast.url
     @tasks = Podcast.where(podpage_id:params[:id])
     @ppage = Podpage.find(params[:id])
 end



 def destroy
   puts "if we somehow get here I swear to god"
  @ppage.destroy
 end

 private

   def all_tasks
     @ppages = Podpage.all
   end
   def set_tasks
      @ppage = Podpage.find(params[:id])
    end

   def ppage_params
     params.require(:podpage).permit(:description, :name)
   end
end
