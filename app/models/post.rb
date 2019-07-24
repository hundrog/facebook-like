class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  validates :user_id, presence: true
  validates :content, presence: true, length: { minimum: 10, maximum: 140 }

  def is_liked_by?(user_id)
    likes.where(user_id: user_id).count > 0
  end

  def same_user?(current_user)
    user == current_user
  end
end
