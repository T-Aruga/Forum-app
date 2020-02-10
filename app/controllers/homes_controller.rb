class HomesController < ApplicationController
  def index
  end
  
  def search
    @q = Board.includes(:comments).search(search_params)
    @boards = @q.result(distinct: true).page(params[:page])
  end
  
  
  private
  
    def search_params
        params.require(:q).permit(:title_or_comments_content_cont)
    end
end
