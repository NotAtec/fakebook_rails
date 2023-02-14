class LikesController < ApplicationController

  def create
    @like = Like.new(user: current_user, likeable_id: params[:likeable_id], likeable_type: params[:likeable_type])
    @like.save
    redirect_back fallback_location: root_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_back fallback_location: root_path
  end
end
