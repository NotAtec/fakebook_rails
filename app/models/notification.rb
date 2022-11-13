class Notification < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :notif_type, presence: true

  def get_object
    case notif_type
    when "invite"
      User.find_by(id: link.split("/").last)
    when "accepted"
      User.find_by(id: link.split("/").last)
    when "comment"
      Post.find_by(id: link.split("/").last)
    when "like"
      Post.find_by(id: link.split("/").last)
    end
  end
end
