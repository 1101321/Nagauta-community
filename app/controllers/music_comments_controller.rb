class MusicCommentsController < ApplicationController
  
  def create
    music = Music.find(params[:music_id])
    comment = MusicComment.new(music_comment_params)
    comment.user_id = current_user.id
    comment.music_id = music.id
    comment.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
  end
  
  private

  def music_comment_params
    params.require(:music_comment).permit(:comment)
  end
  
end
