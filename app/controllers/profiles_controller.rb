class ProfilesController < ApplicationController
  before_action :set_user

  def index
    render json: @user
  end

  def images
    @images = Image.all.select { |image| image.uploaded_by.id == @user.id }
    render json: @images
  end

  def comments
    @comments = Comment.all
    .select { |comment| comment.author.id == @user.id }
    .map { |comment| comment_info(comment) }
    render json: @comments
  end

  private

  def set_user
    @user = current_user
  end
end
