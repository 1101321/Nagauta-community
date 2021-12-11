class MusicsController < ApplicationController

  def create
    @music = Music.new(music_params)
    @music.user_id = current_user.id
    @user = current_user
    if @music.save
      redirect_to music_path(@music.id)
    else
      @musics = Music.all
      render :index
    end
  end

  def index
  end

  def show
    @music = Music.find(params[:id])
    @user = current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def music_params
    params.require(:music).permit(:title, :body)
  end

end
