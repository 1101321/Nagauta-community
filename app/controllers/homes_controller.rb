class HomesController < ApplicationController

  def top
    @user = current_user
    @musics = Music.order(created_at: :desc).limit(2)
  end

  def about
  end

end
