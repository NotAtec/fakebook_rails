class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

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
end
