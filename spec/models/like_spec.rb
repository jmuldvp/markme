require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:topic) { Topic.create!(title: "Test topic")}
  let(:user) { User.create!(email: "user@user.com", password: "pas123", confirmed_at: Date.today)}
  let(:bookmark) { topic.bookmarks.create!(url: "https://www.google.com/", user: user)}
  let(:like) { Like.create!(bookmark: bookmark, user: user)}

  it { is_expected.to belong_to(:bookmark)}
  it { is_expected.to belong_to(:user)}

  
end
