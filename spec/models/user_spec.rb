require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: "user@user.com", password: "pas123", confirmed_at: Date.today)}

  it { is_expected.to have_many(:topics)}
  it { is_expected.to have_many(:bookmarks)}
  it { is_expected.to have_many(:likes)}

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(4) }

  describe "#liked(bookmark)" do
    before do
      topic = Topic.create!(title: "Test topic", user: user)
      @bookmark = topic.bookmarks.create!(url: "https://www.google.com/", user: user)
    end

    it "returns 'nil' if the user has not liked the post" do
      expect(user.liked(@bookmark)).to be_nil
    end

    it "returns the appropriate 'like' if it exists" do
      like = user.likes.where(bookmark: @bookmark).create
      expect(user.liked(@bookmark)).to eq(like)
    end
  end
end
