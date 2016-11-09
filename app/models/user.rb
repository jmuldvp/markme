class User < ApplicationRecord
  before_save { self.email = email.downcase if email.present? }

  validates :email, length: { minimum: 4, maximum: 100 }, presence: true
  
  has_many :topics, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
end
