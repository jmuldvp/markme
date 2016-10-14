require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:my_user) { User.create!(email: "user@markme.com", password: "helloworld", confirmed_at: Date.today) }
  let(:my_topic) { Topic.create!(title: "A title", user: my_user)}
  let(:user) {create(:user)}
  let(:my_bookmark) { my_topic.bookmarks.create!(url: "http://www.google.com/", topic_id: my_topic) }
  before do
    sign_in user
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create, topic_id: my_topic.id, post: {title: "A title"}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      new_title = "New title"
      get :update, topic_id: my_topic.id, id: my_bookmark.id, post: {title: new_title}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_bookmark.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_bookmark.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy, topic_id: my_topic.id, id: my_bookmark.id
      expect(response).to have_http_status(:success)
    end
  end

end
