class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    user = @current_user
    micropost = user.microposts.find_by(micropost_id: @micropost_id)
    user.like(micropost)
    flash[:success] = 'お気に入り登録しました。'
    redirect_to favorites/index
  end

  def destroy
    user = @current_user
    micropost = user.microposts.find_by(micropost_id: @micropost_id)
    user.dislike(micropost)
    flash.now[:danger] = 'お気に入り登録を削除しました。'
    render favorites/index
  end
end
