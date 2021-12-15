class FavoritesController < ApplicationController

  def create
    @musics = Music.find(params[:music_id])
    favorite = current_user.favorites.new(music_id: @musics.id)
    favorite.save
    #redirect_back(fallback_location: root_path)
  end

  def destroy
    @musics = Music.find(params[:music_id])
    favorite = current_user.favorites.find_by(music_id: @musics.id)
    favorite.destroy
    #redirect_back(fallback_location: root_path)
  end

end
