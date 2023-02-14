class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :requests
  has_many :inbound_requests, class_name: 'Request', foreign_key: "friend_id"
  has_many :notifications
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :likeable, source_type: 'Post'
  has_many :liked_comments, through: :likes, source: :likeable, source_type: 'Comment'

  def full_name
    "#{first_name} #{last_name}"
  end

  def friends
    friends_array = requests.map { |request| request.friend_id if request.confirmed }
    friends_array += inbound_requests.map { |request| request.user.id if request.confirmed }
    friends_array.compact
  end

  def outbound_requests
    requests.map { |request| request.friend_id unless request.confirmed }.compact
  end

  def received_requests
    inbound_requests.map { |request| request.user.id unless request.confirmed }
  end

  def send_invitation(user)
    requests.create(friend_id: user.id) unless self == user || Request.exists?(self.id, user.id)
    user.notifications.build({ title: "#{self.full_name} has added you as a friend!", notif_type: "invite", link: "/users/#{self.id}" }).save
  end

  def accept_invitation(user)
    request = Request.find_by(user_id: user.id, friend_id: self.id)
    request.confirmed = true
    request.save
    current_user.notifications.find_by(link: "/users/#{user.id}").destroy
    user.notifications.build({ title: "#{self.full_name} has accepted your friend request!", notif_type: "accept", link: "/users/#{self.id}" }).save
  end

  def remove_friendship(user)
    request = Request.find(user.id, self.id)
    if(current_user.notifications.find_by(link: "/users/#{user.id}"))
      current_user.notifications.find_by(link: "/users/#{user.id}").destroy
    end
    request.destroy
  end
end
