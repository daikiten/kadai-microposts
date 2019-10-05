class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    user = @current_user
    micropost = Micropost.find(params[:micropost_id])
    user.like(micropost)
    flash[:success] = 'お気に入り登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = @current_user
    micropost = Micropost.find(params[:micropost_id])
    user.dislike(micropost)
    flash.now[:danger] = 'お気に入り登録を削除しました。'
    redirect_back(fallback_location: root_url)
  end
end
