class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable
  has_many :likers, through: :likes, source: :user
  
  def post_notification
    author.friends.each do |friend|
      User.find(friend).notifications.build({ title: "#{author.full_name} has posted something!", notif_type: "post", link: "#{id}" }).save
    end
  end

  def update_notification
    author.friends.each do |friend|
      User.find(friend).notifications.build({ title: "#{author.full_name} has updated a post!", notif_type: "post", link: "#{id}" }).save
    end
  end

  def liked_by(user)
    Like.find_by(user_id: user.id, likeable_id: id, likeable_type: 'Post') ? true : false
  end

  def userLike(user)
    Like.find_by(user_id: user.id, likeable_id: id, likeable_type: 'Post')
  end
end
