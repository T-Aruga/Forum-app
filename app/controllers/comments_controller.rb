class CommentsController < ApplicationController
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save 
      flash[:notice] = 'コメントを投稿しました'
    else
      flash[:alert] = '投稿に失敗しました'
    end
    redirect_back(fallback_location: request.referer)
  end
  
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to comment.board, notice: 'コメントが削除されました'
  end
  
  private
    
    def comment_params
      params.require(:comment).permit(:name, :content, :board_id)
    end
    
end
