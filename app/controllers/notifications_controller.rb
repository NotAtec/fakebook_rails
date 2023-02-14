class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    Notification.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Notification Removed.' }
      format.json { head :no_content}
    end
  end
end
