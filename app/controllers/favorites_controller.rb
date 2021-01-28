class FavoritesController < ApplicationController
  def create
    # こう記述することで、「current_userに関連したFavoriteクラスの新しいインスタンス」が作成可能。
    # つまり、favorite.user_id = current_user.idが済んだ状態で生成されている。
    # buildはnewと同じ意味で、アソシエーションしながらインスタンスをnewする時に形式的に使われる。
    favorite = current_user.favorites.build(training_id: params[:training_id])
    favorite.save
    redirect_to root_path, notice: 'お気に入りしました！'
  end

  def destroy
    favorite = Favorite.find_by(training_id: params[:training_id], user_id: current_user.id)
    favorite.destroy
    redirect_to root_path, alert: 'お気に入りを解除しました！'
  end
end
