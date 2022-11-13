class ChangeNotificationBehaviour < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :link, :string
    change_column :notifications, :notif_type, :string
  end
end
