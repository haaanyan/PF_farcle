class AddTitleToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :title, :string
    add_column :boards, :body, :text
    add_column :boards, :user_id, :integer
  end
end
