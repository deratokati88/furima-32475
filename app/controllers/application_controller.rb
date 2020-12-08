class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:f_name,:l_name,:f_kananame,:l_kananame,:nickname,:birthday])
  end
end
