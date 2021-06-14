class User::BoardCommentsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @board_comment = BoardComment.new(board_comment_params)
    @board_comment.board_id = @board.id
    @board_comment.user_id = current_user.id
    @board_comment.save
  end

  def destroy
    @board = Board.find(params[:board_id])
    board_comment = @board.board_comments.find(params[:id])
    board_comment.destroy
  end

  private

  def board_comment_params
    params.require(:board_comment).permit(:comment)
  end
end
