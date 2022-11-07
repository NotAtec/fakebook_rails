class UsersController < ApplicationController

  def index
    # all users listed here with friend options (request, accept, remove)
    @users = User.all
    @received = User.where(id: current_user.received_requests)
    @friends = User.where(id: current_user.friends)
  end

  def show
    @user = User.find(params[:id])
  end

  def request_friendship
    current_user.send_invitation(User.find(params[:id]))
    redirect_to users_path
  end

  def accept_friendship
    request = Request.find_by(user_id: params[:id], friend_id: current_user.id)
    request.confirmed = true
    request.save
    redirect_to users_path
  end

  def remove_friendship
    request = Request.find(params[:id], current_user.id)
    request.destroy
    redirect_to users_path
  end
end
