require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:my_user) { User.create!(email: "user@user.com", password: "pas123", confirmed_at: Date.today)}
  let(:my_topic) { Topic.create!(title: "Test title", user: my_user)}
  let(:my_bookmark) { my_topic.bookmarks.create!(url: "https://www.google.com/", user: my_user)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  context "guest user" do
    describe "POST create" do
      it "redirects the user to the sign in view" do
        post :create, { bookmark_id: my_bookmark.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe "DELETE destroy" do
      it "redirects the user to the sign-in view" do
        like = my_user.likes.where(bookmark: my_bookmark).create
        delete :destroy, { bookmark_id: my_bookmark.id, id: like.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context "signed-in user" do
    before do
      sign_in my_user
    end

    describe "POST create" do
      it "redirects to the bookmarks show view" do
        post :create, { bookmark_id: my_bookmark.id }
        expect(response).to redirect_to([my_topic])
      end

      it "creates a 'like' for the current user and specified bookmark" do
        expect(my_user.likes.find_by_bookmark_id(my_bookmark.id)).to be_nil

        post :create, { bookmark_id: my_bookmark.id }
        expect(my_user.likes.find_by_bookmark_id(my_bookmark.id)).not_to be_nil
      end
    end

    describe "DELETE destroy" do
      it "redirects to the topics show view" do
        like = my_user.likes.where(bookmark: my_bookmark).create
        delete :destroy, { bookmark_id: my_bookmark.id, id: like.id }
        expect(response).to redirect_to(my_topic)
      end

      it "destroys the favorite for the current user and bookmark" do
        like = my_user.likes.where(bookmark: my_bookmark).create
        expect( my_user.likes.find_by_bookmark_id(my_bookmark.id)).not_to be_nil
        delete :destroy, { bookmark_id: my_bookmark.id, id: like.id }
        expect( my_user.likes.find_by_bookmark_id(my_bookmark.id)).to be_nil
      end
    end
  end

end
