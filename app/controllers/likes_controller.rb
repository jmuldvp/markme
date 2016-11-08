class LikesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :about]

  def index
    @likes = Like.all
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize like
    if like.save
      flash[:notice] = "'Like' was saved."
    else
      flash.now[:alert] = "There was an error saving your 'Like'."
      # redirect_to [bookmark.topic, bookmark]
    end
    redirect_to @bookmark.topic
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize like
    if like.destroy
      flash[:notice] = "'Like' was removed."
    else
      flash.now[:alert] = "There was an error removing your 'Like'."
      # redirect_to @topic
    end
    redirect_to @bookmark.topic
  end

end
