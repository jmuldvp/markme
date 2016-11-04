class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :authenticate_user!, except: [:create]

  def create

     puts "INCOMING PARAMS HERE: #{params}"
     @user = User.find_by_email(params[:sender])
     if @user.nil?
       @user = User.create(email: params[:sender], password: "password1")
       @user.save
     end

     @topic = Topic.find_or_create_by(title: params[:subject], user_id: @user.id)
     @bookmark = @topic.bookmarks.find_or_create_by(url: params["body-plain"])

     head 200
  end
end
