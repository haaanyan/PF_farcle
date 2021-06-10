class AddCommentToBoardComments < ActiveRecord::Migration[5.2]
  def change
    add_column :board_comments, :comment, :text
    add_column :board_comments, :board_id, :integer
    add_column :board_comments, :user_id, :integer
  end
end
