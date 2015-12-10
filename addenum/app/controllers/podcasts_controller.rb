class PodcastsController < ApplicationController
  before_action :all_tasks, only: [:index, :create, :update]
  before_action :set_tasks, only: [:edit, :update, :destroy]
  protect_from_forgery

 respond_to :html, :js

 # index action has been removed

 def new
   @task = Podcast.new
 end

 def create
   @task  = Podcast.create(task_params)
   redirect_to podpage_path(@task.podpage_id)
 end

 def destroy
  @task.destroy
 end

 def show
   @adds = Addendum.all
   @pcast = Podcast.find(params[:id])
 end

 private

   def all_tasks
     @tasks = Podcast.all
   end

   def set_tasks
      @task = Podcast.find(params[:id])
    end

   def task_params
     params.require(:podcast).permit(:description, :name, :cast, :podpage_id)
   end
end
