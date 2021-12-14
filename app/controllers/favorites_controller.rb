class FavoritesController < ApplicationController
  
  def create
    music = Music.find(params[:music_id])
    favorite = current_user.favorites.new(music_id: music.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    music = Music.find(params[:music_id])
    favorite = current_user.favorites.find_by(music_id: music.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
