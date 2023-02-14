class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable
  has_many :likers, through: :likes, source: :user

  def liked_by(user)
    Like.find_by(user_id: user.id, likeable_id: id, likeable_type: 'Comment') ? true : false
  end

  def userLike(user)
    Like.find_by(user_id: user.id, likeable_id: id, likeable_type: 'Comment')
  end

  def author
    user
  end
end
