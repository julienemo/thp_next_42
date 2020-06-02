class ApplicationController < ActionController::API
  before_action :sanitize_devise_params, if: :devise_controller?
  respond_to :json
  
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
end
