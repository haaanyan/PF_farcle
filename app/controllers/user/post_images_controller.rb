class User::PostImagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @post_images = PostImage.all.order(updated_at: :desc)
  end

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      tags = Vision.get_image_data(@post_image.image)
      tags.each do |tag|
        @post_image.tags.create(tag_name: tag)
      end
      flash[:notice] = "投稿しました"
      redirect_to post_image_path(@post_image.id)
    else
      render :new
    end
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_image_comment = PostImageComment.new
    @user = @post_image.user
    @post_image_tags = @post_image.tags
  end

  def edit
    @post_image = PostImage.find(params[:id])
    if @post_image.user == current_user
      render "edit"
    else
      redirect_to post_images_path
    end
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      tags = Vision.get_image_data(@post_image.image)
      @post_image.tags.delete_all
      tags.each do |tag|
        @post_image.tags.create(tag_name: tag)
      end
      flash[:notice] = "変更を保存しました"
      redirect_to post_image_path(@post_image.id)
    else
      render :edit
    end
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to user_path(current_user)
  end

  private

  def post_image_params
    params.require(:post_image).permit(:image, :caption)
  end
end
