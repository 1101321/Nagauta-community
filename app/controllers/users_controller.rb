class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @musics = @user.musics
  end

  def index
  end

  def edit
  end

  def update
  end

end
