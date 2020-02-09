class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @boards = Board.page(params[:page])
  end

  def new
    @board = current_user.boards.build
  end

  def create
    board = current_user.boards.create(board_params)
    redirect_to board
  end
  
  def show
  end

  def edit
  end

  def update
    @board.update(board_params)
    redirect_to @board
  end

  def destroy
    @board.delete
    redirect_to boards_path
  end
  

  private

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
  
  def set_board
    @board = Board.find(params[:id])
  end
end
