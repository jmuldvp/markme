class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.friendly.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

  def new
    @topic = Topic.new
  end

  # def edit
  #   @topic = topic.find(params[:id])
  # end

  def create
    @user = current_user
    @topic = @user.topics.build(topic_params)

    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to @topic
    else
      # flash.now[:alert] = "Error creating topic. Please try again."
      flash.now[:alert] = "You need to sign in or sign up before continuing."
      render :new
    end
  end

  def destroy
    @topic = Topic.friendly.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
      redirect_to topics_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title)
  end

end
