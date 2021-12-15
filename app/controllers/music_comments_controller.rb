class MusicCommentsController < ApplicationController
  
  def create
    @music = Music.find(params[:music_id])
    @comment = MusicComment.new(music_comment_params)
    @comment.user_id = current_user.id
    @comment.music_id = @music.id
    @comment.save
    #redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @music = Music.find(params[:music_id])
    comment = @music.music_comments.find(params[:id])
    comment.destroy
    #redirect_back(fallback_location: root_path)
  end
  
  private

  def music_comment_params
    params.require(:music_comment).permit(:comment)
  end
  
end
