class UsersController < ApplicationController
  def show
    @user = current_user
    @user_bookmarks = @user.bookmarks.group_by{ |s| s.topic }
    @liked_bookmarks = @user.user_liked_bookmarks.group_by(&:topic)
  end
end
