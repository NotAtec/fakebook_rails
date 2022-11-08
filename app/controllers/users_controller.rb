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

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def friends
    # Lists all user friends
    @user = User.find(params[:user_id])
    @friends = User.where(id: @user.friends)
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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :avatar)
  end
end
