class ProfilesController < ApplicationController
  before_action :set_user

  def index
    render json: @user
  end

  def images
    @images = Image.all.select { |image| image.uploaded_by.id == @user.id }
    render json: @images
  end

  private

  def set_user
    @user = current_user
  end
end
