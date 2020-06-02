class ImagesController < ApplicationController
  before_action :set_user
  before_action :set_image, only: [:show, :update, :destroy]
  before_action :current_user_can_change_or_delete_image, only: [:update, :destroy]

  def index
    @images = Image.all.select { |image| current_user_can_see_image(image) }
    render json: @images
  end

  def show
    if current_user_can_see_image(@image)
      render json: @image
    else
      render json: { error: 'Cannot find', detail: 'Can not find the required resource' }
    end
  end

  def create
    @image = Image.new(image_params.merge(uploaded_by: @user))

    if @image.save
      render json: @image, status: :created, location: @image
    else
      render json: { error: @image.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @image.update(image_params)
      render json: @image
    else
      render json: { error: @image.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    id = @image.id
    @image.destroy
    render json: { id: id, status: 'image deleted' }
  end

  private

  def set_user
    @user = current_user
  end

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:stream, :extension, :description, :is_private)
  end

  def current_user_can_see_image(image)
    !image.is_private || current_user.id == image.uploaded_by.id
  end

  def current_user_can_change_or_delete_image
    if @user != @image.uploaded_by
      render json: { error: 'Unauthorized', detail: "Can only do this to one's own image" }
    end
  end
end
