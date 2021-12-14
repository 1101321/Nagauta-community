class MusicsController < ApplicationController

  def new
    @music = Music.new
    @user = current_user
  end

  def create
    @music = Music.new(music_params)
    @music.user_id = current_user.id
    @user = current_user
    if @music.save
      redirect_to music_path(@music.id)
    else
      @musics = Music.all
      render :new
    end
  end

  def index
    @musics = Music.all
    @user = current_user
  end

  def show
    @music = Music.find(params[:id])
    @user = current_user
    @music_comment = MusicComment.new
  end

  def edit
    @music = Music.find(params[:id])
    @user = current_user
  end

  def update
    @music = Music.find(params[:id])
    if @music.update(music_params)
      redirect_to music_path(@music.id)
    else
      render :edit
    end
  end


  def destroy
    @music = Music.find(params[:id])
    @music.destroy
    redirect_to musics_path
  end

  private

  def music_params
    params.require(:music).permit(:title, :body)
  end

end
