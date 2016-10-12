class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  # def edit
  #   @topic = topic.find(params[:id])
  # end

  def create
    @topic = Topic.new
    @topic.title = params[:topic]

    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render :new
    end
  end
end
