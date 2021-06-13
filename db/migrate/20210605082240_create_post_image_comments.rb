class CreatePostImageComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_image_comments do |t|
      t.timestamps
    end
  end
end
