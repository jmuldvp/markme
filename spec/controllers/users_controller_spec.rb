require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:my_user) { User.create!(email: "user@user.com", password: "pas123", confirmed_at: Date.today)}
  let(:my_topic) { Topic.create!(title: "Test title", user: my_user)}
  let(:my_bookmark) { my_topic.bookmarks.create!(url: "https://www.google.com/", user: my_user)}

  describe "GET #show" do
    before do
      sign_in my_user
    end

    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
