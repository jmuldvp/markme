class BookmarksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    # @user = current_user
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Bookmark saved successfully"
      # redirect_to [@topic, @bookmark]
    else
      flash.now[:alert] = "You need to be logged in to save bookmarks."
      # render :new
    end
    redirect_to @bookmark
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark was updated successfully."
    else
      flash.now[:alert] = "There was an error saving the bookmark."
    end
    redirect_to @bookmark.topic
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "\"#{@bookmark.url}\" was deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting the bookmark."
    end
    redirect_to @topic
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end

end
