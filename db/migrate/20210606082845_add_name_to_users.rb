class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :prefecture, :string
    add_column :users, :profile_image_id, :string
    add_column :users, :product, :string
    add_column :users, :history, :integer
    add_column :users, :introduction, :string
  end
end
