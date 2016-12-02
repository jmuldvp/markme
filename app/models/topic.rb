class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy

  validates :title, length: { minimum: 3 }, presence: true

  include FriendlyId

  friendly_id :title, use: :slugged
end
