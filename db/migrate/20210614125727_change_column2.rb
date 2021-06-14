class ChangeColumn2 < ActiveRecord::Migration[5.2]
  def change
    change_column_null :favorites, :user_id, false
    change_column_null :favorites, :post_image_id, false
    change_column_null :post_image_comments, :comment, false
    change_column_null :post_image_comments, :user_id, false
    change_column_null :post_image_comments, :post_image_id, false
    change_column_null :post_images, :image_id, false
    change_column_null :post_images, :user_id, false
    change_column_null :relationships, :following_id, false
    change_column_null :relationships, :follower_id, false
    change_column_null :users, :name, false
    change_column_null :users, :product, false
    change_column_null :users, :history, false
    change_column_null :users, :introduction, false

  end
end
