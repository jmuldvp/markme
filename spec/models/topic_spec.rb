require 'rails_helper'

RSpec.describe Topic, type: :model do
  let(:my_user) { User.create!(email: "user@user.com", password: "pas123", confirmed_at: Date.today)}
  let(:my_topic) { Topic.create!(title: "Test topic", user: my_user)}

  it { is_expected.to have_many(:bookmarks)}

  describe "attributes" do
    it "responds to a title attribute" do
      expect(my_topic).to have_attributes(title: my_topic.title)
    end
  end
end
