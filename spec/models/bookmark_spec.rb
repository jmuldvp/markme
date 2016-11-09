require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  it { is_expected.to have_many(:likes)}
end
