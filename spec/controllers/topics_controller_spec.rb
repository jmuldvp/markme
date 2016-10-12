require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
  # let(:my_user) { User.create!(email: "user@markme.com", password: "helloworld", confirmed_at: Date.today) }
  # let(:my_topic) { Topic.create!(title: "A title", user: my_user)}
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


  # context "guest user" do

  describe "GET #show" do
    it "returns http success" do
      get :show #, {id: my_topic.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  # end


  # context "signed-in user" do
  #   before do
  #     create_session()
  #   end
  #
  #   describe "GET #show" do
  #     it "returns http success" do
  #       get :show
  #       expect(response).to have_http_status(:success)
  #     end
  #   end
  #
  #   describe "GET #new" do
  #     it "returns http success" do
  #       get :new
  #       expect(response).to have_http_status(:success)
  #     end
  #   end
  #
  #   describe "GET #edit" do
  #     it "returns http success" do
  #       get :edit
  #       expect(response).to have_http_status(:success)
  #     end
  #   end
  # end

end
