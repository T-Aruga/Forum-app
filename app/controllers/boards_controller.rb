class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @boards = Board.page(params[:page])
  end

  def new
    @board = current_user.boards.build
  end

  def create
    board = current_user.boards.build(board_params)
    if board.save
      redirect_to board, notice: 'スレッドを新規作成しました'
    else
      flash.now[:alert] = 'スレッドの作成に失敗しました'
      render :new
    end
  end
  
  def show
    @comment = Comment.new(board_id: @board.id)
  end

  def edit
  end

  def update
    if @board.update(board_params)
      redirect_to @board, notice: '編集内容を保存しました'
    else
      flash.now[:alert] = '編集内容の保存に失敗しました'
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, notice: 'スレッドを削除しました'
  end
  

  private

  def board_params
    params.require(:board).permit(:name, :title, :body, tag_ids: [])
  end
  
  def set_board
    @board = Board.find(params[:id])
  end
end
