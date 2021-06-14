class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column_null :board_comments, :comment, false
    change_column_null :board_comments, :board_id, false
    change_column_null :board_comments, :user_id, false
    change_column_null :boards, :title, false
    change_column_null :boards, :body, false
    change_column_null :boards, :user_id, false
  end
end
