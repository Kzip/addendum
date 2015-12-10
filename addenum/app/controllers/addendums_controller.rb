class AddendumsController < ApplicationController
  before_action :all_tasks, only: [:index, :create, :update, :destroy]
  before_action :set_tasks, only: [:edit, :update, :destroy]
  protect_from_forgery

  def new
    @add = Addendum.new
  end

  def create
    @add  = Addendum.create(task_params)
    ModelMailer.new_record_notification.deliver
    redirect_to podcast_path(@add.podcast_id)
  end
  def destroy
    puts "we getting here?"
   @add.destroy
  end


  private

    def all_tasks
      @adds = Addendum.all
    end

    def set_tasks
       @add = Addendum.find(params[:id])
     end

    def task_params
      params.require(:addendum).permit(:description, :name, :addendum, :podcast_id)
    end
end
