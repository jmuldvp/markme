require 'rails_helper'

RSpec.describe BookmarksController, type: :controller do
  let(:my_user) { User.create!(email: "user@markme.com", password: "helloworld", confirmed_at: Date.today) }
  let(:my_topic) { Topic.create!(title: "A title", user: my_user)}
  let(:user) {create(:user)}
  let(:my_bookmark) { my_topic.bookmarks.create!(url: "http://www.google.com/", topic_id: my_topic, user: user) }
  before do
    sign_in user
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it do
      expect{post :create, topic_id: my_topic.id, bookmark: {url: "http://timescapes.org/"}}.to change(Bookmark,:count).by(1)
    end
  end

  describe "PUT #update" do
    it "updates bookmark with expected attributes" do
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {topic_id: my_topic.id, id: my_bookmark.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {topic_id: my_topic.id, id: my_bookmark.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the bookmark" do
      delete :destroy, { topic_id: my_topic.id, id: my_bookmark.id }
      count = Bookmark.where( {topic_id: my_topic.id, id: my_bookmark.id}).size
      expect(count).to eq(0)
    end
  end

  describe "PUT update" do
    before do
      sign_in my_user
    end

    it "updates bookmark with expected attributes" do
      new_url = "http://www.reddit.com/"
      put :update, topic_id: my_topic.id, id: my_bookmark.id, bookmark: {url: new_url }
      updated_bookmark = assigns(:bookmark)
      expect(updated_bookmark.id).to eq my_bookmark.id
      expect(updated_bookmark.url).to eq new_url
    end

    it "redirects to the updated bookmark on the topic show page" do
      new_url = "www.linkedin.com"
      put :update, topic_id: my_topic.id, id: my_bookmark.id, bookmark: {url: new_url}
      expect(response).to redirect_to [my_topic]
    end
  end

end
