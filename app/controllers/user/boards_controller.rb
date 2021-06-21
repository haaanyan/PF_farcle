class User::BoardsController < ApplicationController
  def index
    @boards = Board.all
    @keyword = params[:keyword]
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    if @board.save
      flash[:notice] = "トピックを新規作成しました"
      redirect_to board_path(@board)
    else
      render :new
    end
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
    if @board.update(board_params)
      flash[:notice] = "変更内容を保存しました"
      redirect_to board_path(@board.id)
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    flash[:notice] = "トピックを削除しました"
    redirect_to boards_path
  end

  def search
    @keyword = params[:keyword]
    @boards = find_boards(@keyword)
  end

  private

  def find_boards(keyword)
    Board.where("title LIKE? OR body LIKE?", "%#{keyword}%", "%#{keyword}%").order(updated_at: :desc)
  end
  def board_params
    params.require(:board).permit(:title, :body)
  end
end
