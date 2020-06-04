class ApplicationController < ActionController::API
  before_action :sanitize_devise_params, if: :devise_controller?
  before_action :authenticate_user!
  respond_to :json

  rescue_from ActionController::InvalidAuthenticityToken,
              with: :invalid_auth_token

  def sanitize_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name username])
  end

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      error: 'Bad request',
      status: '400',
      code: '100',
      details: resource.errors
    }, status: :bad_request
  end

  def invalid_auth_token
    respond_to do |format|
      format.json { head 401 }
    end
  end

  def image_info(image)
    image.attributes.merge(uploaded_by: image.uploaded_by).merge(comments: image.comments)
  end

  def comment_info(comment)
    comment.attributes.merge(author: comment.author, image: comment.image, parent: comment.parent)
  end

  def current_user_can_see_image(image)
    !image.is_private || current_user.id == image.uploaded_by.id
  end
end
