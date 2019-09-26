class FavoritesController < ApplicationController
  def create
    user = @current_user
    micropost = current_user.microposts.find_by(micropost_id: @micropost_id)
    user.like(micropost)
    falsh[:success] = 'お気に入り登録しました。'
    redirect_to favorites/index
  end

  def destroy
    user = @current_user
    micropost = current_user.microposts.find_by(micropost_id: @micropost_id)
    user.dislike(micropost)
    falsh.now[:danger] = 'お気に入り登録を削除しました。'
    render favorites/index
  end
end
