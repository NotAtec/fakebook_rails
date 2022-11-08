class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  has_many :requests
  has_many :inbound_requests, class_name: 'Request', foreign_key: "friend_id"
  has_many :notifications

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
  end

  def accept_invitation(user)
    request = Request.find_by(user_id: user.id, friend_id: self.id)
    request.confirmed = true
    request.save
  end

  def remove_friendship(user)
    request = Request.find(user.id, self.id)
    request.destroy
  end
end
