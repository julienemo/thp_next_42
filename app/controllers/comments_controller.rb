class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :current_user_can_change_or_delete_comment, only: [:update, :destroy]

  def show
    render json: comment_info(@comment)
  end

  def create
    # TODO: verify parent has same image as child
    image = Image.find(params[:image_id])
    if !current_user_can_see_image(image)
      render json: { error: 'Unauthorized', detail: "You do not have access to this image." }
    else
      @comment = Comment.new(comment_params.merge(author: current_user, image: image))
      if @comment.save
        render json: comment_info(@comment), status: :created, location: @comment
      else
        render json: { error: @comment.errors }, status: :unprocessable_entity
      end
    end
  end

  def update
    # TODO: verify parent has same image as child
    if @comment.update(comment_params)
      render json: comment_info(@comment)
    else
      render json: { error: @comment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.children
      render json: { error: "Can not delete", detail: "Comment has children" }
    else
      id = @comment.id
      @comment.destroy
      render json: { id: id, status: 'comment deleted' }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end 

  def current_user_can_change_or_delete_comment
    if current_user.id != @comment.author.id
      render json: { error: 'Unauthorized', detail: "Can only do this to one's own comment" }
    end
  end
end
