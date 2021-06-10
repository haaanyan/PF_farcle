class User::BoardCommentsController < ApplicationController

  def create
    board = Board.find(params[:board_id])
    comment = current_user.board_comments.new(board_comment_params)
    comment.board_id = board.id
    comment.save
    redirect_to board_path(board)
  end

  def destroy
    BoardComment.find_by(id: params[:id], board_id: params[:board_id]).destroy
    redirect_to board_path(params[:board_id])
  end

  private
  def board_comment_params
    params.require(:board_comment).permit(:comment)
  end

end
