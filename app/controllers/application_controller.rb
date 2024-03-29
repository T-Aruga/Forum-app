class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  
  def set_search
    @q = Board.includes(:comments).ransack(params[:q])
  end
  
  
  protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name])
    end
end
