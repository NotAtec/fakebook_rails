class Request < ApplicationRecord
  belongs_to :user

  def self.exists?(id1, id2)
    where(user_id: id1, friend_id: id2).or(where(user_id: id2, friend_id: id1)).exists?
  end

  def self.find(id1, id2)
    where(user_id: id1, friend_id: id2).or(where(user_id: id2, friend_id: id1)).first
  end
end
