class ApplicationController < ActionController::API
  before_action :sanitize_devise_params, if: :devise_controller?
  respond_to :json
  
  def sanitize_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
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
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end
end
