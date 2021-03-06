class Bookmark < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :url, presence: true
  # validates :user, presence: true
end
