class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :set_layout
  before_action :configurar_strongs_param, if: :devise_controller?

  protected
    def set_layout
      "application"
    end

    def configurar_strongs_param
      devise_parameter_sanitizer.permit(:sign_up,keys: [:username])
    end
end
