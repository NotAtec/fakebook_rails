class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    # all users listed here with friend options (request, accept, remove)
    @users = User.all
    @received = User.where(id: current_user.received_requests)
    @friends = User.where(id: current_user.friends)
    @sent_requests = User.where(id: current_user.outbound_requests)
  end

  def show
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def friends
    # Lists all user friends
    @user = User.find(params[:user_id])
    @friends = User.where(id: @user.friends)
  end

  def request_friendship
    current_user.send_invitation(User.find(params[:id]))
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Friend request sent.' }
      format.json { head :no_content }
    end
  end

  def accept_friendship
    current_user.accept_invitation(current_user, User.find(params[:id]))
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Friend request accepted.' }
      format.json { head :no_content }
    end
  end

  def remove_friendship
    current_user.remove_friendship(current_user, User.find(params[:id]))
    respond_to do |format|
      format.html { redirect_back fallback_location: users_path, alert: 'Friend removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :bio, :avatar)
  end
end
