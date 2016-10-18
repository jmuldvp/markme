class BookmarksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]

  def new
    # @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @user = current_user
    @topic = @user.Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark saved successfully"
      redirect_to [@topic, @bookmark]
    else
      flash.now[:alert] = "You need to be logged in to save bookmarks."
      render :new
    end
  end

  def update
  end

  def edit
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end
