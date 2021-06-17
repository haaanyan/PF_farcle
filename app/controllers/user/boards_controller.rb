class User::BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    @board.save
    redirect_to board_path(@board)
  end

  def show
    @board = Board.find(params[:id])
    @user = @board.user
    @board_comment = BoardComment.new
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)
    redirect_to board_path(@board.id)
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to boards_path
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end
end
