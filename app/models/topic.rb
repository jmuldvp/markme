class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookmarks #, dependent: :destroy
end
