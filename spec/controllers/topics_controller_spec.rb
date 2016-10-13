require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  let(:my_user) { User.create!(email: "user@markme.com", password: "helloworld", confirmed_at: Date.today) }
  let(:my_topic) { Topic.create!(title: "A title", user: my_user)}
  let(:user) {create(:user)}
  before do
    sign_in user
  end


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #show" do
    it "returns http success" do
      get :show, { id: my_topic.id }
      expect(response).to have_http_status(:success)
    end
  end


  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @post" do
      get :new
      expect(assigns(:topic)).not_to be_nil
    end
  end


  describe "TOPIC create" do
    it "increases the number of Topic by 1" do
      expect{post :create, topic: {title: "A title"}}.to change(Topic,:count).by(1)
    end

    it "assigns Topic.last to @topic" do
      post :create, {topic: {title: "A title"}}
      expect(assigns(:topic)).to eq Topic.last
     end

    it "redirects to the new topic" do
      post :create, {topic: {title: "A title"}}
      expect(response).to redirect_to Topic.last
    end

    it "flash notice success" do
      post :create, {topic: {title: "A title"}}
      expect(flash[:notice]).to be_present
    end

    it "flash alert error(success)" do
      post :create, {topic: {title: "At"}}
      expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
    end
  end


  describe "GET #edit" do
    it "returns http success" do
      get :edit, { id: my_topic.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE destroy" do
    it "deletes the topic" do
      delete :destroy, {id: my_topic.id}
      count = Topic.where({id: my_topic.id}).size
      expect(count).to eq 0
    end

    it "redirects to topics index" do
      delete :destroy, {id: my_topic.id}
      expect(response).to redirect_to topics_path
    end

    it "flashes #notice" do
      delete :destroy, {id: my_topic.id}
      expect(flash[:notice]).to be_present
    end

    it "flash alert error(success)" do
      # post :create, {topic: {title: "A title"}}
      sign_out user
      delete :destroy, {id: my_topic.id}
      expect(flash[:alert]).to eq("You need to sign in or sign up before continuing.")
    end
  end

end
