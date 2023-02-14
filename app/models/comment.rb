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

  def comment_notification
    User.find(post.author.id).notifications.build({ title: "#{author.full_name} has commented on your post!", notif_type: "post", link: "#{post.id}" }).save
  end
end
