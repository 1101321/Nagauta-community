class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @musics = @user.musics
  end

  def index
    @users = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def favorites
    @user = current_user
     favorites = Favorite.where(user_id: current_user.id).pluck(:music_id)
    @favorite_list = Music.find(favorites)
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
