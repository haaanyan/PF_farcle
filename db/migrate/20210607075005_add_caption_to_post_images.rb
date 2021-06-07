class AddCaptionToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :caption, :text
    add_column :post_images, :image_id, :string
    add_column :post_images, :user_id, :integer
  end
end
